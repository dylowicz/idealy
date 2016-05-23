class TaskBoxContainer extends React.Component {
    constructor() {
        super();
        this.state = {tasks: []};

        this.onTaskSubmit = this.onTaskSubmit.bind(this);
        this.onTaskClick = this.onTaskClick.bind(this);
        this._loadTasksFromServer = this._loadTasksFromServer.bind(this);
        this._createTask = this._createTask.bind(this);
        this._updateTask = this._updateTask.bind(this);
    }

    componentDidMount() {
        this._loadTasksFromServer();
    }

    onTaskSubmit(event, title) {
        event.preventDefault();
        $('#add-task').val('');
        if (title.trim() === "") return;
        const newTask = {
            title: title.trim(),
            completed: false
        };

        // does not work for some reason even when backend has injected delay in response :/
        // let tmpTask = Object.assign({id: Date.now()}, newTask);
        // console.log(newTask);
        // console.log(tmpTask);
        // const actualTasks = this.state.tasks;
        // const newTasks = actualTasks.concat([tmpTask]);
        // this.setState(newTasks);

        this._createTask(this.props.url, {task: newTask});
    }

    onTaskClick(event, id) {
        event.preventDefault();
        const task = this.state.tasks.find(task => task.id === id)
        const editedTask = {
            id: id,
            completed: !task.completed
        }
        this._updateTask(this.props.url + '/' + id, {task: editedTask});
    }

    _loadTasksFromServer() {
        $.ajax({
            url: this.props.url,
            method: "GET",
            dataType: 'json',
            cache: false,
            success: (tasks) => {
                this.setState({tasks: tasks});
            }
        });
    }

    _createTask(url, data) {
        $.ajax({
            url: url,
            method: 'POST',
            data: data,
            success: () => this._loadTasksFromServer(),
            error: (xhr, status, err) =>  {
                this.setState({tasks: this.state.tasks});
                console.error(url, status, err.toString());
            }
        });
    }

    _updateTask(url, data) {
        // does not reload immediately for some reason
        // $.when(Request.patch(url, data)).done(() => {
        //     this._loadTasksFromServer();
        // });
        $.ajax({
            url: url,
            method: 'PATCH',
            data: data,
            dataType: 'json',
            success: () => this._loadTasksFromServer(),
            error: (xhr, status, err) =>  {
                this.setState({tasks: this.state.tasks});
                console.error(url, status, err.toString());
            }
        });
    }

    render() {
        return (
            <div className="tasks-box well">
                <TaskList tasks={this.state.tasks} onTaskClick={this.onTaskClick}/>
                <TaskForm onTaskSubmit={this.onTaskSubmit}/>
            </div>
        );
    }
}