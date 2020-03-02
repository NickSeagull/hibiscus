using butler.LuaHelpers;
using System;
using System.Windows.Forms;

namespace butler.Services
{
    class ButlerCore
    {
        KeyboardHook hook = new KeyboardHook();

        public void Run()
        {
            var prefs = Preferences.Load();

            // TODO: Pass `KeyboardHook` reference to LuaEngine global
            var luaEngine = new LuaEngine(prefs);
            luaEngine.RunInit();

            // register the event that is fired after the key press.
            hook.KeyPressed +=
                new EventHandler<KeyPressedEventArgs>(hook_KeyPressed);
            // register the control + alt + F12 combination as hot key.
            hook.RegisterHotKey(ModifierKeys.Control | ModifierKeys.Alt,
                Keys.F12);
        }

        private void hook_KeyPressed(object sender, KeyPressedEventArgs e)
        {
            MessageBox.Show("pressed");
        }
    }
}
