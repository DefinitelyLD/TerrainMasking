using Commands;
using UnityEngine;

public class GloballUndoRedoSystemTest : MonoBehaviour
{
    // Start is called once before the first execution of Update after the MonoBehaviour is created
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        if(Input.GetKeyDown(KeyCode.U))
            CommandHistory.Undo();
        else if(Input.GetKeyDown(KeyCode.R))
            CommandHistory.Redo();
    }
}
