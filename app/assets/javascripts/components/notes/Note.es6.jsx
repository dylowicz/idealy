const Note = ({content, onNoteDeleteClick}) => (
    <div className="list-group-item" id="note">
        <p className="list-group-item-text">{content}</p>
        <span onClick={onNoteDeleteClick} className="glyphicon glyphicon-trash pull-right" id="delete-note"></span>
    </div>
);