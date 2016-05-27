const NoteList = ({notes, onNoteEditSaveClick, onNoteDeleteClick}) => (
    <div className="list-unstyled" id="note-list">
        {
            notes.map(note =>
                <NoteContainer
                    key={note.id}
                    note={note}
                    onNoteEditSaveClick={onNoteEditSaveClick}
                    onNoteDeleteClick={() => onNoteDeleteClick(note.id)}
                />
            )
        }
    </div>
);