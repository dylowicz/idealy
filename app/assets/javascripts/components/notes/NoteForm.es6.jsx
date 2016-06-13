const NoteForm = ({onNoteSubmit}) => {
    let input;

    return (
        <form onSubmit={event => onNoteSubmit(event, input.value)}>
            <div className="form-group">
                <textarea
                    className="form-control"
                    id="add-note-content-textarea"
                    placeholder="Enter your thought"
                    ref={node => input = node}
                />
            </div>
            <input
                type="submit"
                name="commit"
                value="Add Thought"
                className="btn btn-primary"
                id="add-note"
            />
        </form>
    );
};

module.exports = NoteForm;
