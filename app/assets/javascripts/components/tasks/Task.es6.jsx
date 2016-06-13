const Task = ({title, completed, onTaskClick, onTaskDeleteClick}) => (
    <li className="list-group-item-unstyled task-item">
        <div className="checkbox">
            <label className="task-label" onClick={onTaskClick} style={ {textDecoration: completed ? 'line-through' : 'none'} }>
                <input type="checkbox" value="" checked={completed} readOnly/>
                {' '}{title}
            </label>
            <span onClick={onTaskDeleteClick} className="glyphicon glyphicon-trash pull-right delete-task"></span>
        </div>
    </li>
);

module.exports = Task;