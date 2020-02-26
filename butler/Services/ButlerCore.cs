namespace butler.Services
{
    class ButlerCore
    {
        public void Run()
        {
            var prefs = Preferences.Load();
            var luaEngine = new LuaEngine(prefs);
            luaEngine.RunInit();
        }
    }
}
