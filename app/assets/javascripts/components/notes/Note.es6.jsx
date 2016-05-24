const Note = ({content, onNoteDeleteClick}) => (
    <li className="list-group-item-unstyled" id="note">
        <p className="list-group-item-text">{content}</p>
        <span onClick={onNoteDeleteClick} className="glyphicon glyphicon-trash pull-right" id="delete-note"></span>
    </li>
);