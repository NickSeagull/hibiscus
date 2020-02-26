using System;
using System.IO;

namespace butler.Services
{
    public class Preferences
    {

        public string Directory;

        public static Preferences Load()
        {
            var folder = Environment.GetFolderPath(
                Environment.SpecialFolder.MyDocuments
            );
            return new Preferences(Path.Combine(folder, "Butler"));
        }

        private Preferences(string directory)
        {
            Directory = directory;
        }
    }
}
