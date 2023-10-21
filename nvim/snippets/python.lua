return {
	-- Imports
	s("impnp", t("import numpy as np")),
	s("imppd", t("import pandas as pd")),
	s("imptf", t("import tensorflow as tf")),
	-- Printing
	s("pr", sn(1, { t("print("), i(1), t(')') })),
	s("prs", sn(1, { t("print('"), i(1), t("')") })),
	s("prf", sn(1, { t("print(f'"), i(1), t("')") })),
	-- Main
	s("main", {
		t({ 'if __name__ == "__main__":', '' }),
		t('\t'), i(1)
	})
}, {}
