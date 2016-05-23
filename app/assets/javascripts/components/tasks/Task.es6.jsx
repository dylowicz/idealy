const Task = ({onClick, completed, title}) => (
    <li className="list-group-item-unstyled">
        <div className="checkbox" onClick={onClick}>
            <label style={
                      { textDecoration: completed ? 'line-through' : 'none' }
                    }
            >
                <input
                    type="checkbox"
                    value=""
                    checked={completed}
                    readOnly
                />
                {' '}{title}
            </label>
        </div>
    </li>
);