class TasksBox extends React.Component {
    constructor(props) {
        super(props);
        this.state = {tasks: this.props.tasks};

        this.onTaskSubmit = this.onTaskSubmit.bind(this);
        this.onTaskClick = this.onTaskClick.bind(this);
        this.onTaskDeleteClick = this.onTaskDeleteClick.bind(this);
        this._getTasks = this._getTasks.bind(this);
        this._createTask = this._createTask.bind(this);
        this._updateTask = this._updateTask.bind(this);
        this._deleteTask = this._deleteTask.bind(this);
    }

    componentDidMount() {
        this._getTasks();
    }

    onTaskSubmit(event, title) {
        event.preventDefault();
        $('#add-task-title').val('');
        if (title.trim() === "") return;
        const newTask = {
            title: title.trim(),
            completed: false
        };

        this._createTask(this.props.url, {task: newTask});
    }

    onTaskClick(event, id) {
        event.preventDefault();
        const task = this.state.tasks.find(task => task.id === id);
        const editedTask = {
            id: id,
            completed: !task.completed
        }
        this._updateTask(this.props.url + '/' + id, {task: editedTask});
    }

    onTaskDeleteClick(id) {
        this._deleteTask(this.props.url + '/' + id);
    }

    _getTasks() {
        $.ajax({
            url: this.props.url,
            method: 'GET',
            dataType: 'json',
            cache: false,
            success: (tasks) => {
                this.setState({tasks: tasks});
            },
            error: (xhr, status, err) =>  {
                this.setState({tasks: this.state.tasks});
                console.error(url, status, err.toString());
            }
        });
    }

    _createTask(url, data) {
        $.ajax({
            url: url,
            method: 'POST',
            dataType: 'json',
            data: data,
            success: () => this._getTasks(),
            error: (xhr, status, err) =>  {
                this.setState({tasks: this.state.tasks});
                console.error(url, status, err.toString());
            }
        });
    }

    _updateTask(url, data) {
        $.ajax({
            url: url,
            method: 'PATCH',
            dataType: 'json',
            data: data,
            success: () => this._getTasks(),
            error: (xhr, status, err) =>  {
                this.setState({tasks: this.state.tasks});
                console.error(url, status, err.toString());
            }
        });
    }

    _deleteTask(url) {
        $.ajax({
            url: url,
            method: 'DELETE',
            success: () => this._getTasks(),
            error: (xhr, status, err) =>  {
                this.setState({tasks: this.state.tasks});
                console.error(url, status, err.toString());
            }
        });
    }

    render() {
        const numberOfNotCompletedTasks = this.state.tasks.filter(task => !task.completed).length;

        return (
            <div className="tasks-box container-fluid">
                <h3 className="text-center">
                    Tasks{' '}
                    { numberOfNotCompletedTasks > 0 ? <span className="badge" id="task-count">{numberOfNotCompletedTasks}</span> : null }
                </h3>
                <div className="well">
                    { this.state.tasks.length === 0 ?
                        <p className="text-muted text-center">There's nothing to do!</p> :
                        <TaskList tasks={this.state.tasks} onTaskClick={this.onTaskClick} onTaskDeleteClick={this.onTaskDeleteClick}/>
                    }
                    <TaskForm onTaskSubmit={this.onTaskSubmit}/>
                </div>
            </div>
        );
    }
}