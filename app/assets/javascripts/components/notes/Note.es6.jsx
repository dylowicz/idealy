const Note = ({content, created_at, onNoteEditContentClick, onNoteSaveClick, onNoteCancelClick, onNoteDeleteClick, inEditMode, inputHeight}) => {
    let input;

    const panelBody = <div
        onDoubleClick={event => onNoteEditContentClick(event)}
        className="panel-body"
        id="note-content">
        {content}
    </div>;

    const textarea = <textarea
        className="form-control"
        id="edit-note-content"
        style={{height: inputHeight}}
        defaultValue={content}
        ref={node => input = node}
    />;

    const dateSpan = <small
        className="text-muted"
        id="note-created-at">
        {new Date(created_at.slice(0, -1)).toLocaleString()}
    </small>;

    const saveButton = <a
        onClick={() => onNoteSaveClick(input.value)}
        id="save-edit-note">
        Save
    </a>;

    const cancelButton = <a
        onClick={onNoteCancelClick}
        className="text-muted"
        id="cancel-edit-note">
        Cancel
    </a>;

    const deleteButton = <span
        onClick={onNoteDeleteClick}
        className="glyphicon glyphicon-trash pull-right"
        id="delete-note"
    />;

    const editActionButtons = <div
        style={{display: "inline"}}>
        {saveButton}{' '}{cancelButton}
    </div>;

    return (
        <div className="panel panel-primary" id="note">
            { inEditMode ? textarea : panelBody }
            <div className="panel-footer" id="note-footer">
                { inEditMode ? editActionButtons : dateSpan }
                {deleteButton}
            </div>
        </div>
    );
}