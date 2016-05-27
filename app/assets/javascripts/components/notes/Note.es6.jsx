const Note = ({content, created_at, onNoteEditContentClick, onNoteSaveClick, onNoteDeleteClick, inEditMode, inputHeight}) => {
    let input;

    const panelBody = <div
        onDoubleClick={event => onNoteEditContentClick(event)}
        className="panel-body"
        id="note-content">
        {content}
    </div>;

    const saveButton = <a
        onClick={() => onNoteSaveClick(input.value)}
        id="save-edit-note">
        Save
    </a>;

    const dateSpan = <small
        className="text-muted"
        id="note-created-at">
        {new Date(created_at.slice(0, -1)).toLocaleString()}
    </small>;

    const textarea = <textarea
        className="form-control"
        id="edit-note-content"
        style={{height: inputHeight}}
        defaultValue={content}
        ref={node => input = node}
    />;

    const deleteButton = <span
        onClick={onNoteDeleteClick}
        className="glyphicon glyphicon-trash pull-right"
        id="delete-note"
    />;

    return (
        <div className="panel panel-primary" id="note">
            { inEditMode ? textarea : panelBody }
            <div className="panel-footer" id="note-footer">
                { inEditMode ? saveButton : dateSpan }
                {deleteButton}
            </div>
        </div>
    );
}