const Task = ({onTaskClick, onTaskDeleteClick, completed, title}) => (
    <li className="list-group-item-unstyled">
        <div className="checkbox" id="task">
            <label onClick={onTaskClick} style={ {textDecoration: completed ? 'line-through' : 'none'} }>
                <input type="checkbox" value="" checked={completed} readOnly/>
                {' '}{title}
            </label>
            <span onClick={onTaskDeleteClick} className="glyphicon glyphicon-trash pull-right" id="delete-task"></span>
        </div>
    </li>
);