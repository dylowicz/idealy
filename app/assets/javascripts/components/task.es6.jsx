class Task extends React.Component {
    render() {
        return (
            <div className="task">
                <div>Completed: {this.props.completed}</div>
                <div classname="task-title">{this.props.title}</div>
            </div>
        );
    }
}

class TaskList extends React.Component {
    render() {
        console.log(this.props.tasks);
        let tasks = this.props.tasks.map(function(task) {
            return (
                <Task key={task.id} completed={task.completed} title={task.title} />
            );
        });

        return (
            <div className="task-list">
                {tasks}
            </div>
        );
    }
}

class TaskForm extends React.Component {
    constructor(props) {
        super(props);
        this.state = {title: ''};
        this.handleTextChange = this.handleTextChange.bind(this);
        this.handleTaskSubmit = this.handleTaskSubmit.bind(this);
    }

    handleTextChange(e) {
        this.setState({title: e.target.value});
    }

    handleTaskSubmit(e) {
        e.preventDefault();
        let title = this.state.title.trim();
        if (!title) return;
        this.props.onTaskSubmit({title: title, completed: false});
        this.setState({title: ''})
    }

    render() {
        return (
            <form className="task-form" onSubmit={this.handleTaskSubmit}>
                <input type="text" placeholder="Add a new task" value={this.state.title} onChange={this.handleTextChange}/>
            </form>
        );
    }
}

class TaskBox extends React.Component {
    constructor(props) {
        super(props);
        this.state = {tasks: this.props.tasks};
        this.handleTaskSubmit = this.handleTaskSubmit.bind(this);
    }

    loadCommentsFromServer() {
        $.ajax({
            url: this.props.url,
            method: "GET",
            dataType: 'json',
            cache: false,
            success: (data) => {
                this.setState({tasks: data});
            },
            error: (xhr, status, err) => {
                console.error(this.props.url, status, err.toString());
            }
        });
    }

    handleTaskSubmit(task) {
        let tasks = this.state.tasks;
        task.id = Date.now();
        let newTasks = tasks.concat([task]);
        console.log(newTasks);
        this.setState(newTasks);

        $.ajax({
            url: this.props.url,
            method: "POST",
            data: {task: task},
            success: (data) => {
                this.loadCommentsFromServer();
            },
            error: (xhr, status, err) =>  {
                this.setState({tasks: tasks});
                console.error(this.props.url, status, err.toString());
            }
        });
    }

    render() {
        return (
          <div className="task-box">
            <h1>Tasks</h1>
            <TaskList tasks={this.state.tasks}/>
            <TaskForm onTaskSubmit={this.handleTaskSubmit}/>
          </div>
        );
    }
}