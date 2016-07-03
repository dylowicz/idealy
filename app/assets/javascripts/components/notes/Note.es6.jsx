const React = require('react');

const Note = ({title, content, created_at, onNoteEditDoubleClick, onNoteSaveClick, onNoteCancelClick, onNoteDeleteClick, inEditMode, textAreaHeight}) => {
    let titleInput, contentInput;

    const panelHeader = <div
        onDoubleClick={event => onNoteEditDoubleClick(event)}
        className="panel-heading note-title">
        {title}
    </div>;

    const textField = <input
        type="text"
        className="form-control edit-note-title-textfield"
        placeholder="Ask a question"
        defaultValue={title}
        ref={node => titleInput = node}
    />;

    const panelBody = <div
        onDoubleClick={event => onNoteEditDoubleClick(event)}
        className="panel-body note-content">
        {content}
    </div>;

    const textArea = <textarea
        className="form-control edit-note-content-textarea"
        style={{height: textAreaHeight}}
        defaultValue={content}
        ref={node => contentInput = node}
    />;

    const dateSpan = <small
        className="text-muted note-created-at">
        {new Date(created_at.slice(0, -1)).toLocaleString()}
    </small>;

    const saveButton = <a
        onClick={() => onNoteSaveClick(titleInput.value, contentInput.value)}
        className="save-edit-note">
        Save
    </a>;

    const cancelButton = <a
        onClick={onNoteCancelClick}
        className="text-muted cancel-edit-note">
        Cancel
    </a>;

    const deleteButton = <span
        onClick={onNoteDeleteClick}
        className="glyphicon glyphicon-trash pull-right delete-note"
    />;

    const editActionButtons = <div
        style={{display: "inline"}}>
        {saveButton}{' '}{cancelButton}
    </div>;

    return (
        <div className="panel panel-primary note-item">
            { inEditMode ? textField : panelHeader }
            { inEditMode ? textArea : panelBody }
            <div className="panel-footer note-footer">
                { inEditMode ? editActionButtons : dateSpan }
                {deleteButton}
            </div>
        </div>
    );
};

module.exports = Note;
