///////////////////////////////////////////////////////////////////////
//	Info B_DIA_Addon_Myxir_TeachRequest
///////////////////////////////////////////////////////////////////////
func void B_DIA_Addon_Myxir_TeachRequest ()
{
	AI_Output	(other, self, "DIA_Addon_Myxir_TeachRequest_15_00"); //Ens��ame ese idioma.
}; 

func void B_DIA_Addon_Myxir_TeachL1 ()
{
	AI_Output	(self, other, "DIA_Addon_Myxir_TeachL1_12_00"); //Empezaremos con algo f�cil. Para comenzar, te ense�ar� el idioma de los campesinos.
	AI_Output	(self, other, "DIA_Addon_Myxir_TeachL1_12_01"); //Como norma general, los textos en idioma campesino tratan de asuntos como el trabajo, el amor o c�mo conseguir comida.
	AI_Output	(self, other, "DIA_Addon_Myxir_TeachL1_12_02"); //Era el idioma com�n de la ciudad. Si lo conoces, podr�s comprender casi todos los textos que encuentres aqu�.
};

func void B_DIA_Addon_Myxir_TeachL2 ()
{
	AI_Output	(self, other, "DIA_Addon_Myxir_TeachL2_12_00"); //Ya conoces el idioma de los campesinos. El de los guerreros es algo m�s dif�cil.
	AI_Output	(self, other, "DIA_Addon_Myxir_TeachL2_12_01"); //Los textos en idioma guerrero tratan sobre todo de armas y guerra. Aprender�s muchas cosas �tiles.
};

func void B_DIA_Addon_Myxir_TeachL3 ()
{
	AI_Output	(self, other, "DIA_Addon_Myxir_TeachL3_12_00"); //El lenguaje refinado de los sacerdotes es muy dif�cil de entender, pero te lo ense�ar�.
	AI_Output	(self, other, "DIA_Addon_Myxir_TeachL3_12_01"); //Sobre todo, las escrituras sagradas, que explican la historia y la magia de los creadores, est�n escritas en el idioma de los sacerdotes.
	AI_Output	(self, other, "DIA_Addon_Myxir_TeachL3_12_02"); //Cada uno de estos textos es un aut�ntico tesoro, si uno sabe descifrarlos.
};

func void B_DIA_Addon_Myxir_TeachNoMore ()
{
	AI_Output 	(self, other,"DIA_Addon_Myxir_TeachNoMore_12_00"); //No te puedo ense�ar nada m�s. Ya dominas el idioma de los constructores.
};

func void B_DIA_Addon_Myxir_Teach_LANGUAGE_X ()
{
	AI_Output	(self, other, "DIA_Addon_Myxir_Teach_LANGUAGE_X_12_00"); //Ve a poner a prueba tus nuevos conocimientos. Ver�s que las escrituras de los constructores ya no son misterios indescifrables para ti.
};



