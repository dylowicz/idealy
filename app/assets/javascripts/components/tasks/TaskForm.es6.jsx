const TaskForm = ({onTaskSubmit}) => {
    let input;

    return (
        <form onSubmit={event => onTaskSubmit(event, input.value)}>
            <div className="input-group">
                <div className="input-group-addon">
                    <span className="glyphicon glyphicon-plus"></span>
                </div>
                <input
                    type="text"
                    className="form-control"
                    id="add-task-title-textfield"
                    placeholder="Add a new task"
                    ref={node => input = node}
                />
            </div>
        </form>
    );
};
