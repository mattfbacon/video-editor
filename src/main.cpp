#include <gtkmm.h>

class MyWindow : public Gtk::Window {
protected:
	Gtk::Label test_label;
public:
	MyWindow() : test_label(Gtk::Label("React Bad")) {
		set_title("Eternal Truth");
		set_default_size(200, 200);
		add(test_label);
		show_all();
	}
};

int main(int argc, char* argv[]) {
	auto application = Gtk::Application::create("com.branhamcodes.videoeditor");
	MyWindow window;
	application->run(window, argc, argv);

	return EXIT_SUCCESS;
}
