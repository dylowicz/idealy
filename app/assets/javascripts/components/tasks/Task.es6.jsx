const Task = ({onTaskClick, onTaskDeleteClick, completed, title}) => (
    <li className="list-group-item-unstyled">
        <div className="checkbox" onClick={onTaskClick}>
            <label style={ {textDecoration: completed ? 'line-through' : 'none'} }>
                <input type="checkbox" value="" checked={completed} readOnly/>
                {' '}{title}
            </label>
        </div>
        {' '}<span onClick={onTaskDeleteClick} className="glyphicon glyphicon-trash pull-right"></span>
    </li>
);