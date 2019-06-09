
using UnityEngine;

class DontDestroy : MonoBehaviour
{
    void Awake()
    {
        DontDestroyOnLoad(this);
    }
}
