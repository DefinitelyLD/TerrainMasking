using System.Collections.Generic;

namespace Commands
{    
    public static class CommandHistory
    {
        private const int MAX_UNDO_LENGTH = 50;
        
        private static LinkedList<ICommand> _undoHistory = new LinkedList<ICommand>();
        private static LinkedList<ICommand> _redoHistory = new LinkedList<ICommand>();

        private static int _currenHistoryLength = MAX_UNDO_LENGTH;

        public static void SetUndoHistoryLength(int length)
        {
            _currenHistoryLength = length;
        }
        
        public static void Register(ICommand command)
        {
            if (_undoHistory.Count > _currenHistoryLength)
            {
                _undoHistory.Last.Value.DestroyCommand();
                _undoHistory.RemoveLast();    
            }

            _undoHistory.AddFirst(command);
            
            foreach (ICommand redoCommand in _redoHistory)
            {
                redoCommand.DestroyCommand();    
            }
            _redoHistory.Clear();
        }

        public static void Undo()
        {
            if (_undoHistory.Count > 0)
            {
                var cmd = _undoHistory.First;
                cmd.Value.Undo();

                _undoHistory.Remove(cmd);
                _redoHistory.AddFirst(cmd);
            }
        }

        public static void Redo()
        {
            if (_redoHistory.Count > 0)
            {
                var cmd = _redoHistory.First;
                cmd.Value.Execute();

                _redoHistory.Remove(cmd);
                _undoHistory.AddFirst(cmd);
            }
        }

        public static void Clear()
        {
            _undoHistory.Clear();
            _redoHistory.Clear();
        }
    }
}