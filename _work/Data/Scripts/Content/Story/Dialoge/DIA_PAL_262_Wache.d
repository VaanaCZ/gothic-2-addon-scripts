///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_PAL_262_EXIT   (C_INFO)
{
	npc         = PAL_262_Wache;
	nr          = 999;
	condition   = DIA_PAL_262_EXIT_Condition;
	information = DIA_PAL_262_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_PAL_262_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_PAL_262_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info GREET
///////////////////////////////////////////////////////////////////////
instance DIA_PAL_262_GREET		(C_INFO)
{
	npc			 = 	PAL_262_Wache;
	nr			 =	2;
	condition	 = 	DIA_PAL_262_GREET_Condition;
	information	 = 	DIA_PAL_262_GREET_Info;
	important	 =  TRUE;
};
func int DIA_PAL_262_GREET_Condition ()
{	
	return TRUE;
};
func void DIA_PAL_262_GREET_Info ()
{
	AI_Output (self, other, "DIA_PAL_262_GREET_10_00"); //Стой - ты кто такой?
	AI_Output (other, self, "DIA_PAL_262_GREET_15_01"); //Вопрос не в том, кто я такой, а откуда я пришел. А пришел я через Проход.
	AI_Output (other, self, "DIA_PAL_262_GREET_15_02"); //Ты все еще хочешь остановить меня, или, может, я все же пройду?
	AI_Output (self, other, "DIA_PAL_262_GREET_10_03"); //Ну, откуда же я мог знать? Конечно же, ты можешь пройти.

	/*
	AI_Output (self, other, "DIA_Addon_PAL_262_GREET_10_00"); //Halt - wer bist du?
	AI_Output (other, self, "DIA_Addon_PAL_262_GREET_15_01"); //Viel wichtiger ist die Frage, wo ich herkomme. Ich bin ьber den Pass gekommen.
	AI_Output (other, self, "DIA_Addon_PAL_262_GREET_15_02"); //Also willst du mich jetzt aufhalten oder kann ich rein?
	AI_Output (self, other, "DIA_Addon_PAL_262_GREET_10_03"); //Konnte ich ja nicht wissen. Klar kannst du rein.
	*/
	
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info PERM
///////////////////////////////////////////////////////////////////////
instance DIA_Wache_PERM		(C_INFO)
{
	npc			 = 	PAL_262_Wache;
	nr			 = 	3;
	condition	 = 	DIA_Wache_PERM_Condition;
	information	 = 	DIA_Wache_PERM_Info;
	permanent	 = 	TRUE;
	description	 = 	"Кто командует здесь?";
};

func int DIA_Wache_PERM_Condition ()
{	
	if Npc_KnowsInfo (hero,DIA_PAL_262_GREET)
	{
		return TRUE;
	};
};
func void DIA_Wache_PERM_Info ()
{
	/* obskur
	AI_Output (other, self, "DIA_Wache_PERM_15_00"); //Wer hat hier das Sagen?
	AI_Output (self, other, "DIA_Wache_PERM_10_01"); //Unser Kommandant Garond und seine beiden Berater, die Paladine Oric und Parcival.
	AI_Output (self, other, "DIA_Wache_PERM_10_02"); //Geh einfach rein. Tagsuber halten sie sich im Thronsaal im Erdgeschoss auf.
	*/
	AI_Output (other, self, "DIA_Addon_Wache_PERM_15_00"); //Кто здесь главный?
	AI_Output (self, other, "DIA_Addon_Wache_PERM_10_01"); //Наш командир Гаронд и два его советника - Орик и Парсиваль.
	AI_Output (self, other, "DIA_Addon_Wache_PERM_10_02"); //Проходи внутрь. В дневное время ты можешь найти их в тронном зале на первом этаже. 
};



 







