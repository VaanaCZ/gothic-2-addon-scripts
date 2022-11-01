///////////////////////////////////////////////////////////////////////
//	Info B_DIA_Addon_Myxir_TeachRequest
///////////////////////////////////////////////////////////////////////
func void B_DIA_Addon_Myxir_TeachRequest ()
{
	AI_Output	(other, self, "DIA_Addon_Myxir_TeachRequest_15_00"); //Научи меня этому языку.
}; 

func void B_DIA_Addon_Myxir_TeachL1 ()
{
	AI_Output	(self, other, "DIA_Addon_Myxir_TeachL1_12_00"); //Ну, начнем с чего-нибудь простого. В первую очередь займемся языком крестьян.
	AI_Output	(self, other, "DIA_Addon_Myxir_TeachL1_12_01"); //Как правило, тексты, написанные на языке крестьян, связаны с нашим миром, с такими понятиями, как работа, любовь, добыча пищи.
	AI_Output	(self, other, "DIA_Addon_Myxir_TeachL1_12_02"); //Это - основной язык города. Ты сможешь прочесть большинство текстов, которые найдешь здесь, если его освоишь.
};

func void B_DIA_Addon_Myxir_TeachL2 ()
{
	AI_Output	(self, other, "DIA_Addon_Myxir_TeachL2_12_00"); //Ты уже знаком с языком крестьян. Язык воинов немного более сложен.
	AI_Output	(self, other, "DIA_Addon_Myxir_TeachL2_12_01"); //Тексты, написанные на языке воинов, в основном касаются войн и оружия. Ты узнаешь кое-что полезное.
};

func void B_DIA_Addon_Myxir_TeachL3 ()
{
	AI_Output	(self, other, "DIA_Addon_Myxir_TeachL3_12_00"); //Высокий штиль жрецов трудно понять. Но я с радостью обучу тебя ему.
	AI_Output	(self, other, "DIA_Addon_Myxir_TeachL3_12_01"); //Помимо прочего, священные книги, описывающие историю и магию создателей, написаны на языке жрецов.
	AI_Output	(self, other, "DIA_Addon_Myxir_TeachL3_12_02"); //Каждый из этих текстов - настоящее сокровище, если, конечно, ты можешь его понять. 
};

func void B_DIA_Addon_Myxir_TeachNoMore ()
{
	AI_Output 	(self, other,"DIA_Addon_Myxir_TeachNoMore_12_00"); //Больше мне нечего тебе показать. Ты изучил язык зодчих.
};

func void B_DIA_Addon_Myxir_Teach_LANGUAGE_X ()
{
	AI_Output	(self, other, "DIA_Addon_Myxir_Teach_LANGUAGE_X_12_00"); //Пойди и опробуй свои новые знания. Ты увидишь, что священные книги зодчих больше не являются для тебя тайной.
};



