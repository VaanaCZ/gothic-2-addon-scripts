///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Valentino_EXIT   (C_INFO)
{
	npc         = VLK_421_Valentino;
	nr          = 999;
	condition   = DIA_Valentino_EXIT_Condition;
	information = DIA_Valentino_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Valentino_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Valentino_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Valentino_HALLO		(C_INFO)
{
	npc		 	= VLK_421_Valentino;
	nr 			= 1;
	condition	= DIA_Valentino_HALLO_Condition;
	information	= DIA_Valentino_HALLO_Info;
	permanent 	= FALSE;
	description	= "Так, и что у нас здесь?";
};

func int DIA_Valentino_HALLO_Condition ()
{
	return TRUE;
};

func void DIA_Valentino_HALLO_Info ()
{
	AI_Output			(other, self, "DIA_Valentino_HALLO_15_00"); //Так, и что у нас здесь?
	//AI_Output (other, self, "DIA_Valentino_Add_15_00"); //Hey, wer bist du denn?
	if (hero.guild == GIL_KDF)
	|| (hero.guild == GIL_PAL)
	{
		AI_Output			(self, other, "DIA_Valentino_HALLO_03_01"); //Меня зовут Валентино. Я пытаюсь не осквернить этот день, данный мне Инносом, своей работой.
		AI_Output			(other, self, "DIA_Valentino_HALLO_15_02"); //Придержи язык.
		AI_Output			(self, other, "DIA_Valentino_HALLO_03_03"); //Ох, прошу прощения, я не хотел оскорбить нашего Владыку. Еще раз прошу простить меня.
	}
	else
	{
		AI_Output			(self, other, "DIA_Valentino_HALLO_03_04"); //Ты незнаком с хорошими манерами? Это отвратительно!
		AI_Output			(self, other, "DIA_Valentino_HALLO_03_05"); //Повсюду этот грязный сброд. У тебя что, нет работы, которой ты должен заниматься?
		AI_Output			(self, other, "DIA_Valentino_HALLO_03_06"); //Но, я полагаю, никто не хватится такого бездельника как ты, да?
		AI_Output			(self, other, "DIA_Valentino_HALLO_03_07"); //Ну, если бы у тебя было столько же золота, сколько у меня, ты бы уж тоже не работал. Но тебе никогда не стать таким богатым.
		AI_Output			(other, self, "DIA_Valentino_HALLO_15_08"); //Ты такой забавный.
	};
};

// ********************************************************
// 						WhoAgain
// ********************************************************

instance DIA_Valentino_WhoAgain		(C_INFO)
{
	npc		 	= VLK_421_Valentino;
	nr 			= 2;
	condition	= DIA_Valentino_WhoAgain_Condition;
	information	= DIA_Valentino_WhoAgain_Info;
	permanent 	= FALSE;
	description	= "Я спросил тебя, кто ты такой!";
};

func int DIA_Valentino_WhoAgain_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Valentino_HALLO))
	&& (other.guild != GIL_KDF)
	&& (other.guild != GIL_PAL)
	{
		return TRUE;
	};
};

func void DIA_Valentino_WhoAgain_Info ()
{
	AI_Output (other, self, "DIA_Valentino_Add_15_01"); //Я спросил тебя, кто ты такой!
	//AI_Output			(other, self, "DIA_Valentino_HALLO_wasmachstdu_15_00"); //Was macht jemand wie du in der Stadt?
	AI_Output			(self, other, "DIA_Valentino_HALLO_wasmachstdu_03_01"); //Я Валентино Великолепный. Бонвиан и любимчик женщин.
	AI_Output			(self, other, "DIA_Valentino_HALLO_wasmachstdu_03_02"); //Бедный заботами, богатый мудростью и золотом, женщины так и бросаются на меня.
	AI_Output			(self, other, "DIA_Valentino_HALLO_wasmachstdu_03_03"); //Если у тебя есть проблемы, держи их при себе. Мне они не нужны.
};

// ********************************************************
// 						Manieren
// ********************************************************

instance DIA_Valentino_Manieren		(C_INFO)
{
	npc		 	= VLK_421_Valentino;
	nr 			= 3;
	condition	= DIA_Valentino_Manieren_Condition;
	information	= DIA_Valentino_Manieren_Info;
	permanent 	= FALSE;
	description	= "Похоже, мне придется поучить тебя хорошим манерам!";
};

func int DIA_Valentino_Manieren_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Valentino_HALLO))
	&& (other.guild != GIL_PAL)
	&& (other.guild != GIL_KDF)
	{
		return TRUE;
	};
};

func void DIA_Valentino_Manieren_Info ()
{
	AI_Output (other, self, "DIA_Valentino_Add_15_02"); //Похоже, мне придется поучить тебя хорошим манерам!
	//AI_Output			(other, self, "DIA_Valentino_HALLO_klappe_15_00"); //Fьr deine dьnnen Дrmchen hast du 'ne ganz schцn groЯe Klappe!
	AI_Output			(self, other, "DIA_Valentino_HALLO_klappe_03_01"); //Меня это не волнует! Молоти меня, сколько хочешь. А когда я встану завтра утром, я опять буду красавчиком.
	AI_Output			(self, other, "DIA_Valentino_HALLO_klappe_03_02"); //Но тебе придется жить дальше с этим преступлением до конца своих дней.
};

///////////////////////////////////////////////////////////////////////
//	Info Wasnuetzliches
///////////////////////////////////////////////////////////////////////

var int Valentino_Lo_Perm;
var int Valentino_Hi_Perm;
//---------------------------------------------------

instance DIA_Valentino_WASNUETZLICHES		(C_INFO)
{
	npc		 	= VLK_421_Valentino;
	nr 			= 4;
	condition	= DIA_Valentino_WASNUETZLICHES_Condition;
	information	= DIA_Valentino_WASNUETZLICHES_Info;
	permanent	= TRUE;
	description	= "Ты еще что-нибудь можешь сказать мне?";
};

func int DIA_Valentino_WASNUETZLICHES_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Valentino_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Valentino_WASNUETZLICHES_Info ()
{
	AI_Output (other, self, "DIA_Valentino_Add_15_03"); //(спокойно) Ты еще что-нибудь можешь сказать мне?
	//AI_Output			(other, self, "DIA_Valentino_WASNUETZLICHES_15_00"); //Kannst du mir was Nьtzliches ьber die Stadt erzдhlen?
	
	if (self.aivar[AIV_DefeatedByPlayer] == TRUE)
	{
		B_Say (self, other, "$NOTNOW");
	}
	else if (Valentino_Lo_Perm == FALSE)
	&& (other.guild != GIL_PAL)
	&& (other.guild != GIL_KDF)
	{
		AI_Output (self, other, "DIA_Valentino_WASNUETZLICHES_03_01"); //Стань популярным, никогда ничего никому не обещай, бери то, что можешь, и смотри, чтобы не ввязаться в драку с ополчением.
		AI_Output (self, other, "DIA_Valentino_WASNUETZLICHES_03_02"); //Или с ревнивым мужем, конечно. Это хуже всего, уж поверь мне.
		Valentino_Lo_Perm = TRUE;
	}
	else if (Valentino_Hi_Perm == FALSE)
	&& ( (other.guild == GIL_PAL) || (other.guild == GIL_KDF) )
	{
		AI_Output (self, other, "DIA_Valentino_WASNUETZLICHES_03_03"); //Для человека в твоем положении нет ничего невозможного. Ты просто должен знать, когда нужно действовать.
		AI_Output (self, other, "DIA_Valentino_WASNUETZLICHES_03_04"); //Так что не теряй времени и действуй.
		Valentino_Hi_Perm = TRUE;
	}
	else
	{
		AI_Output (self ,other,"DIA_Valentino_WASNUETZLICHES_03_05"); //Я сказал тебе все, что тебе нужно знать. Остальное за тобой.
	};
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Valentino_PICKPOCKET (C_INFO)
{
	npc			= VLK_421_Valentino;
	nr			= 900;
	condition	= DIA_Valentino_PICKPOCKET_Condition;
	information	= DIA_Valentino_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(Украсть этот ключ будет легко)";
};                       

FUNC INT DIA_Valentino_PICKPOCKET_Condition()
{
	if (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == 1) 
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (Npc_HasItems(self, ItKe_Valentino) >= 1)
	&& (other.attribute[ATR_DEXTERITY] >= (30 - Theftdiff))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Valentino_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Valentino_PICKPOCKET);
	Info_AddChoice		(DIA_Valentino_PICKPOCKET, DIALOG_BACK 		,DIA_Valentino_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Valentino_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Valentino_PICKPOCKET_DoIt);
};

func void DIA_Valentino_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 30)
	{
		B_GiveInvItems (self, other, ItKe_Valentino, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GivePlayerXP (XP_Ambient);
		Info_ClearChoices (DIA_Valentino_PICKPOCKET);
	}
	else
	{
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); 
	};
};
	
func void DIA_Valentino_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Valentino_PICKPOCKET);
};




