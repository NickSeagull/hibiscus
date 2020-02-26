using NLua;
using System.IO;

namespace butler.Services
{
    public class LuaEngine
    {
        private Preferences preferences;
        private Lua state;

        public LuaEngine(Preferences preferences)
        {
            this.preferences = preferences;
            this.state = new Lua();
            this.state.LoadCLRPackage();
            this.state.DoString("_G.b = require \"b\" ");
        }

        public void SetGlobal(string name, object value)
        {
            this.state[name] = value;
        }

        public object GetGlobal(string name)
        {
            return this.state[name];
        }

        public void LoadFiles(params string[] files)
        {
            foreach (var file in files)
            {
                state.LoadFile(file);
            }
        }

        public void RunInit()
        {
            state.DoFile(Path.Combine(this.preferences.Directory, "init.lua"));
        }

        public object RunCode(string code)
        {
            return state.DoString(code);
        }
    }
}
