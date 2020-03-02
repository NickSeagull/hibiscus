using NLua;
using System;
using System.IO;
using System.Windows;

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
            this.state.DoString("_G.b = require 'butler'");
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
            try
            {
                state.DoFile(Path.Combine(this.preferences.Directory, "init.lua"));
            }
            catch (Exception e)
            {
                MessageBox.Show(e.Message);
            }
        }

        public object RunCode(string code)
        {
            return state.DoString(code);
        }
    }
}
