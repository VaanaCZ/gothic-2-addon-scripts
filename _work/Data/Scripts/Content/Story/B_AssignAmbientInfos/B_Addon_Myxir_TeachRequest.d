///////////////////////////////////////////////////////////////////////
//	Info B_DIA_Addon_Myxir_TeachRequest
///////////////////////////////////////////////////////////////////////
func void B_DIA_Addon_Myxir_TeachRequest ()
{
	AI_Output	(other, self, "DIA_Addon_Myxir_TeachRequest_15_00"); //Lehre mich die fremde Sprache.
}; 

func void B_DIA_Addon_Myxir_TeachL1 ()
{
	AI_Output	(self, other, "DIA_Addon_Myxir_TeachL1_12_00"); //Fangen wir erst einmal einfach an. Ich kann dich zu Anfang die Sprache der Bauern lehren.
	AI_Output	(self, other, "DIA_Addon_Myxir_TeachL1_12_01"); //Texte, die in der Sprache der Bauern geschrieben sind, handeln in der Regel von weltlichen Belangen, wie Arbeit, Liebe oder die Beschaffung von Lebensmitteln.
	AI_Output	(self, other, "DIA_Addon_Myxir_TeachL1_12_02"); //Es war die gemeine Sprache der Stadt. Die meisten Texte, die man hier findet, wirst du damit verstehen können.
};

func void B_DIA_Addon_Myxir_TeachL2 ()
{
	AI_Output	(self, other, "DIA_Addon_Myxir_TeachL2_12_00"); //Die Sprache der Bauern kennst du ja bereits. Die Sprache der Krieger ist schon etwas schwieriger.
	AI_Output	(self, other, "DIA_Addon_Myxir_TeachL2_12_01"); //Texte, die in der Sprache der Krieger geschrieben wurden, handeln meistens von Waffen und dem Krieg. Du wirst einige für dich nützliche Dinge dort erfahren.
};

func void B_DIA_Addon_Myxir_TeachL3 ()
{
	AI_Output	(self, other, "DIA_Addon_Myxir_TeachL3_12_00"); //Die hohe Sprache der Priester ist wahrhaftig sehr schwer zu verstehen. Aber ich kann sie dir gerne zeigen.
	AI_Output	(self, other, "DIA_Addon_Myxir_TeachL3_12_01"); //In der Sprache der Priester sind vor allem heilige Schriften verfasst, die die Geschichte und Magie der Erbauer erklären.
	AI_Output	(self, other, "DIA_Addon_Myxir_TeachL3_12_02"); //Jeder dieser Texte ist eine wahre Kostbarkeit, wenn man ihren Sinn versteht.
};

func void B_DIA_Addon_Myxir_TeachNoMore ()
{
	AI_Output 	(self, other,"DIA_Addon_Myxir_TeachNoMore_12_00"); //Es gibt nichts mehr, was ich dir noch zeigen könnte. Du beherrschst jetzt die Sprache der Erbauer.
};

func void B_DIA_Addon_Myxir_Teach_LANGUAGE_X ()
{
	AI_Output	(self, other, "DIA_Addon_Myxir_Teach_LANGUAGE_X_12_00"); //Geh hin und erprobe dein neues Wissen. Du wirst sehen, dass die Schriften der Erbauer nicht länger ein unlösbares Rätsel für dich sind.
};



