import React from 'react';
import './EditorActions.css';

interface EditorActionsProps {
  onDuplicate: () => void;
  onDelete: () => void;
  onSave: () => void;
  hasSelectedMission?: boolean;
}

export const EditorActions: React.FC<EditorActionsProps> = ({
  onDuplicate,
  onDelete,
  onSave,
  hasSelectedMission = false
}) => {
  return (
    <div className='editorActions'>
        
      <div className='editorActions-left'>
        <button 
          className='editorActions-btn editorActions-duplicate'
          onClick={onDuplicate}
          disabled={!hasSelectedMission}
        >
          Сделать дубликат</button>
        <button 
          className='editorActions-btn editorActions-delete'
          onClick={onDelete}
          disabled={!hasSelectedMission}
        >
          Удалить</button>
      </div>

      <button 
        className='editorActions-btn editorActions-save'
        onClick={onSave}
      >
        Сохранить</button>
    </div>
  );
};

export default EditorActions;