const NoteList = ({notes, onNoteDeleteClick}) => (
    <ul className="list-unstyled" id="note-list">
        {
            notes.map(note =>
                <Note
                    key={note.id}
                    {...note}
                    onNoteDeleteClick={() => onNoteDeleteClick(note.id)}
                />
            )
        }
    </ul>
);