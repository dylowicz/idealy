const Note = ({title, content, created_at, onNoteDeleteClick}) => (
    <div className="panel panel-primary" id="note">
        { title ? <div className="panel-heading" id="note-heading">{title}</div> : null }
        <div className="panel-body">{content}</div>
        <div className="panel-footer" id="note-footer">
            <small className="text-muted">{new Date(created_at.slice(0, -1)).toLocaleString()}</small>
            <span onClick={onNoteDeleteClick} className="glyphicon glyphicon-trash pull-right" id="delete-note"></span>
        </div>
    </div>
);