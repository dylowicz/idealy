const TaskList = ({tasks, onTaskClick, onTaskDeleteClick}) => (
    <ul className="list-unstyled checked-list-box" id="tasks-list">
        {
            tasks.map(task =>
                <Task
                    key={task.id}
                    {...task}
                    onTaskClick={(event) => onTaskClick(event, task.id)}
                    onTaskDeleteClick={() => onTaskDeleteClick(task.id)}
                />
            )
        }
    </ul>
);
