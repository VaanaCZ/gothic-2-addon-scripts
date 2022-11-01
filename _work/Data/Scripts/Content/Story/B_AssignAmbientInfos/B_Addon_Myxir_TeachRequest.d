///////////////////////////////////////////////////////////////////////
//	Info B_DIA_Addon_Myxir_TeachRequest
///////////////////////////////////////////////////////////////////////
func void B_DIA_Addon_Myxir_TeachRequest ()
{
	AI_Output	(other, self, "DIA_Addon_Myxir_TeachRequest_15_00"); //Enséñame ese idioma.
}; 

func void B_DIA_Addon_Myxir_TeachL1 ()
{
	AI_Output	(self, other, "DIA_Addon_Myxir_TeachL1_12_00"); //Empezaremos con algo fácil. Para comenzar, te enseñaré el idioma de los campesinos.
	AI_Output	(self, other, "DIA_Addon_Myxir_TeachL1_12_01"); //Como norma general, los textos en idioma campesino tratan de asuntos como el trabajo, el amor o cómo conseguir comida.
	AI_Output	(self, other, "DIA_Addon_Myxir_TeachL1_12_02"); //Era el idioma común de la ciudad. Si lo conoces, podrás comprender casi todos los textos que encuentres aquí.
};

func void B_DIA_Addon_Myxir_TeachL2 ()
{
	AI_Output	(self, other, "DIA_Addon_Myxir_TeachL2_12_00"); //Ya conoces el idioma de los campesinos. El de los guerreros es algo más difícil.
	AI_Output	(self, other, "DIA_Addon_Myxir_TeachL2_12_01"); //Los textos en idioma guerrero tratan sobre todo de armas y guerra. Aprenderás muchas cosas útiles.
};

func void B_DIA_Addon_Myxir_TeachL3 ()
{
	AI_Output	(self, other, "DIA_Addon_Myxir_TeachL3_12_00"); //El lenguaje refinado de los sacerdotes es muy difícil de entender, pero te lo enseñaré.
	AI_Output	(self, other, "DIA_Addon_Myxir_TeachL3_12_01"); //Sobre todo, las escrituras sagradas, que explican la historia y la magia de los creadores, están escritas en el idioma de los sacerdotes.
	AI_Output	(self, other, "DIA_Addon_Myxir_TeachL3_12_02"); //Cada uno de estos textos es un auténtico tesoro, si uno sabe descifrarlos.
};

func void B_DIA_Addon_Myxir_TeachNoMore ()
{
	AI_Output 	(self, other,"DIA_Addon_Myxir_TeachNoMore_12_00"); //No te puedo enseñar nada más. Ya dominas el idioma de los constructores.
};

func void B_DIA_Addon_Myxir_Teach_LANGUAGE_X ()
{
	AI_Output	(self, other, "DIA_Addon_Myxir_Teach_LANGUAGE_X_12_00"); //Ve a poner a prueba tus nuevos conocimientos. Verás que las escrituras de los constructores ya no son misterios indescifrables para ti.
};



