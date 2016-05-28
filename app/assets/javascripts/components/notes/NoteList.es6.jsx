const NoteList = ({notes, onNoteEditSaveClick, onNoteDeleteClick}) => (
    <div className="list-unstyled" id="notes-list">
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