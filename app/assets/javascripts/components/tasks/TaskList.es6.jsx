const TaskList = ({tasks, onTaskClick}) => (
    <ul className="list-unstyled checked-list-box">
        {
            tasks.map(task =>
                <Task
                    key={task.id}
                    {...task}
                    onClick={(event) => onTaskClick(event, task.id)}
                />
            )
        }
    </ul>
);