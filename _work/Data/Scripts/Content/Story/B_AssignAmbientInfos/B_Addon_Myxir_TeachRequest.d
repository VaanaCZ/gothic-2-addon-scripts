///////////////////////////////////////////////////////////////////////
//	Info B_DIA_Addon_Myxir_TeachRequest
///////////////////////////////////////////////////////////////////////
func void B_DIA_Addon_Myxir_TeachRequest ()
{
	AI_Output	(other, self, "DIA_Addon_Myxir_TeachRequest_15_00"); //Teach me that language.
}; 

func void B_DIA_Addon_Myxir_TeachL1 ()
{
	AI_Output	(self, other, "DIA_Addon_Myxir_TeachL1_12_00"); //We'll start with something easy. To begin with, I can teach you the language of the peasants.
	AI_Output	(self, other, "DIA_Addon_Myxir_TeachL1_12_01"); //As a rule, texts written in the language of the peasants deal with worldly matters such as work, love or obtaining food.
	AI_Output	(self, other, "DIA_Addon_Myxir_TeachL1_12_02"); //It was the common language of the city. You will be able to understand most of the texts found here if you know it.
};

func void B_DIA_Addon_Myxir_TeachL2 ()
{
	AI_Output	(self, other, "DIA_Addon_Myxir_TeachL2_12_00"); //You already know the language of the peasants. The language of the warriors is somewhat harder.
	AI_Output	(self, other, "DIA_Addon_Myxir_TeachL2_12_01"); //Texts written in the language of the warriors mostly deal with weapons and war. You will learn some useful things there.
};

func void B_DIA_Addon_Myxir_TeachL3 ()
{
	AI_Output	(self, other, "DIA_Addon_Myxir_TeachL3_12_00"); //The high language of the priests is truly difficult to understand. But I will gladly show you.
	AI_Output	(self, other, "DIA_Addon_Myxir_TeachL3_12_01"); //Above all else, the holy scriptures, which explain the history and magic of the creators, are written in the language of the priests.
	AI_Output	(self, other, "DIA_Addon_Myxir_TeachL3_12_02"); //Each of these texts is a real treasure, if one understands their meaning.
};

func void B_DIA_Addon_Myxir_TeachNoMore ()
{
	AI_Output 	(self, other,"DIA_Addon_Myxir_TeachNoMore_12_00"); //There is nothing more that I can show you. You have now mastered the language of the builders.
};

func void B_DIA_Addon_Myxir_Teach_LANGUAGE_X ()
{
	AI_Output	(self, other, "DIA_Addon_Myxir_Teach_LANGUAGE_X_12_00"); //Go and test your new knowledge. You will see that the scriptures of the builders are no longer an unsolvable mystery for you.
};



