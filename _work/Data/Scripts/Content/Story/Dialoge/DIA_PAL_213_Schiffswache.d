///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Pal_213_Schiffswache_EXIT   (C_INFO)
{
	npc         = Pal_213_Schiffswache;
	nr          = 999;
	condition   = DIA_Pal_213_Schiffswache_EXIT_Condition;
	information = DIA_Pal_213_Schiffswache_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Pal_213_Schiffswache_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Pal_213_Schiffswache_EXIT_Info()
{
	AI_StopProcessInfos (self);
};


// ************************************************************
// 				  	Guard_Passage - First Warn
// ************************************************************

// ------------------------------------------------------------
	const string Pal_213_Checkpoint		= "SHIP_DECK_09";					//Auf dem Schiff
// ------------------------------------------------------------

instance DIA_Pal_213_Schiffswache_FirstWarn (C_INFO)
{
	npc			= Pal_213_Schiffswache;
	nr			= 1;
	condition	= DIA_Pal_213_Schiffswache_FirstWarn_Condition;
	information	= DIA_Pal_213_Schiffswache_FirstWarn_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

func int DIA_Pal_213_Schiffswache_FirstWarn_Condition()
{
	if ((MIS_ShipIsFree == FALSE) 
	&&	(self.aivar[AIV_Guardpassage_Status]			== GP_NONE		)
	&&  (self.aivar[AIV_PASSGATE]						== FALSE		)
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)		== TRUE			))
	{
		return TRUE;
	};
};

func void DIA_Pal_213_Schiffswache_FirstWarn_Info()
{
	AI_Output (self, other,"DIA_Pal_213_Schiffswache_FirstWarn_01_00"); //Стой! Куда это ты идешь?
	AI_Output (other, self,"DIA_Pal_213_Schiffswache_FirstWarn_15_01"); //Я хотел...

	if ((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		AI_Output (self, other,"DIA_Pal_213_Schiffswache_FirstWarn_01_02"); //Извини. Но тебе сюда нельзя.
	}
	else
	{	
		AI_Output (self, other,"DIA_Pal_213_Schiffswache_FirstWarn_01_03"); //Здесь не на что смотреть. Иди своей дорогой.
	};

	other.aivar[AIV_LastDistToWP] 			= Npc_GetDistToWP(other,Pal_213_Checkpoint);
	self.aivar[AIV_Guardpassage_Status]		= GP_FirstWarnGiven;
};


// ************************************************************
// 				  	Guard_Passage - Second Warn
// ************************************************************

INSTANCE DIA_Pal_213_Schiffswache_SecondWarn (C_INFO)
{
	npc			= Pal_213_Schiffswache;
	nr			= 2;
	condition	= DIA_Pal_213_Schiffswache_SecondWarn_Condition;
	information	= DIA_Pal_213_Schiffswache_SecondWarn_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

FUNC INT DIA_Pal_213_Schiffswache_SecondWarn_Condition()
{
	if ((MIS_ShipIsFree == FALSE) 
	&&	(self.aivar[AIV_Guardpassage_Status]			== GP_FirstWarnGiven						)
	&&  (self.aivar[AIV_PASSGATE]						== FALSE								) 
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)		== TRUE									)
	&&  (Npc_GetDistToWP(other,Pal_213_Checkpoint)		<  (other.aivar[AIV_LastDistToWP]-50)	)) 
	{
		return TRUE;
	};
};

func void DIA_Pal_213_Schiffswache_SecondWarn_Info()
{
	if ((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		AI_Output (self, other,"DIA_Pal_213_Schiffswache_SecondWarn_01_00"); //Ни шагу дальше. Исключений нет ни для кого.
	}
	else
	{
		AI_Output (self, other,"DIA_Pal_213_Schiffswache_SecondWarn_01_01"); //Ты же не хочешь ЗАСТАВИТЬ меня ударить тебя, правда?
	};
	other.aivar[AIV_LastDistToWP] 			= Npc_GetDistToWP (other,Pal_213_Checkpoint);
	self.aivar[AIV_Guardpassage_Status]	= GP_SecondWarnGiven;	
	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 				  	Guard_Passage - Attack
// ************************************************************

INSTANCE DIA_Pal_213_Schiffswache_Attack (C_INFO)
{
	npc			= Pal_213_Schiffswache;
	nr			= 3;
	condition	= DIA_Pal_213_Schiffswache_Attack_Condition;
	information	= DIA_Pal_213_Schiffswache_Attack_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

FUNC INT DIA_Pal_213_Schiffswache_Attack_Condition()
{
	if ((MIS_ShipIsFree == FALSE) 
	&&	(self.aivar[AIV_Guardpassage_Status]			== GP_SecondWarnGiven					)
	&&  (self.aivar[AIV_PASSGATE]						== FALSE								) 
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)		== TRUE									)
	&&  (Npc_GetDistToWP(other,Pal_213_Checkpoint)		<  (other.aivar[AIV_LastDistToWP]-50)	))
	{
		return TRUE;
	};
};

func void DIA_Pal_213_Schiffswache_Attack_Info()
{
	other.aivar[AIV_LastDistToWP] 			= 0;
	self.aivar[AIV_Guardpassage_Status]	= GP_NONE;						//wird auch in ZS_Attack resettet
	
	AI_StopProcessInfos	(self);												//dem Spieler sofort wieder die Kontrolle zurьckgeben
	
	B_Attack (self, other, AR_GuardStopsIntruder, 1);
};


//#############################
//###						###
//###		Kapitel 5		###
//###						###
//#############################


///////////////////////////////////////////////////////////////////////
//	Abziehen 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Pal_213_Schiffswache_GoOnBoard   (C_INFO)
{
	npc         = Pal_213_Schiffswache;
	nr          = 5;
	condition   = DIA_Pal_213_Schiffswache_GoOnBoard_Condition;
	information = DIA_Pal_213_Schiffswache_GoOnBoard_Info;
	permanent   = FALSE;
	description = "Я хочу попасть на борт корабля.";
};

FUNC INT DIA_Pal_213_Schiffswache_GoOnBoard_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Pal_213_Schiffswache_GoOnBoard_Info()
{
	AI_Output (other,self ,"DIA_Pal_213_Schiffswache_GoOnBoard_15_00"); //Я хочу попасть на борт корабля.
	AI_Output (self ,other,"DIA_Pal_213_Schiffswache_GoOnBoard_01_01"); //Никому не позволено входить на корабль! У меня есть приказ!
	AI_Output (self ,other,"DIA_Pal_213_Schiffswache_GoOnBoard_01_02"); //Я должен убить всякого, кто войдет на корабль без соответствующего разрешения.
	AI_Output (self ,other,"DIA_Pal_213_Schiffswache_GoOnBoard_01_03"); //Во имя Инноса, я буду защищать этот корабль даже ценой своей жизни.
};

//**********************************************************
//sc ist kdf -Du stellst den Wunsch eines eines Magiers des Feuers in Frage?
//**********************************************************

INSTANCE DIA_Pal_213_Schiffswache_IAmKDF   (C_INFO)
{
	npc         = Pal_213_Schiffswache;
	nr          = 6;
	condition   = DIA_Pal_213_Schiffswache_IAmKDF_Condition;
	information = DIA_Pal_213_Schiffswache_IAmKDF_Info;
	permanent   = FALSE;
	description = "Ты сомневаешься в намерениях Мага Огня?";
};

FUNC INT DIA_Pal_213_Schiffswache_IAmKDF_Condition()
{
	if (Hero.guild == GIL_KDF)
	&& (Npc_KnowsInfo (other,DIA_Pal_213_Schiffswache_GoOnBoard))
	{
		return TRUE;
	};
};

FUNC VOID DIA_Pal_213_Schiffswache_IAmKDF_Info()
{
	AI_Output (other,self ,"DIA_Pal_213_Schiffswache_IAmKDF_15_00"); //Ты сомневаешься в намерениях Мага Огня?
	AI_Output (self ,other,"DIA_Pal_213_Schiffswache_IAmKDF_01_01"); //(нервно) Нет, конечно же, нет. Да простит меня Иннос.
	AI_Output (self ,other,"DIA_Pal_213_Schiffswache_IAmKDF_01_02"); //(нервно) Маги Огня - стражи мудрости Инноса...
	AI_Output (self ,other,"DIA_Pal_213_Schiffswache_IAmKDF_01_03"); //(нервно) ...тот, кто сомневается в них, сомневается в Инносе и не заслуживает пощады.
};

//**********************************************************
//Was passiert, wenn ich an Bord gehe?
//**********************************************************

INSTANCE DIA_Pal_213_Schiffswache_IAmKDF2   (C_INFO)
{
	npc         = Pal_213_Schiffswache;
	nr          = 6;
	condition   = DIA_Pal_213_Schiffswache_IAmKDF2_Condition;
	information = DIA_Pal_213_Schiffswache_IAmKDF2_Info;
	permanent   = FALSE;
	description = "Что будет, если я взойду на борт?";
};

FUNC INT DIA_Pal_213_Schiffswache_IAmKDF2_Condition()
{
	if (Hero.guild == GIL_KDF)
	&& (Npc_KnowsInfo (other,DIA_Pal_213_Schiffswache_IAmKDF))
	{
		return TRUE;
	};
};

FUNC VOID DIA_Pal_213_Schiffswache_IAmKDF2_Info()
{
	AI_Output (other,self ,"DIA_Pal_213_Schiffswache_IAmKDF2_15_00"); //Что будет, если я взойду на борт?
	AI_Output (self ,other,"DIA_Pal_213_Schiffswache_IAmKDF2_01_01"); //(нервно) Я должен убить... я хочу сказать, остановить тебя.
};

//**********************************************************
//Du wьrdest einen Magier des Feuers angreifen?
//**********************************************************

INSTANCE DIA_Pal_213_Schiffswache_IAmKDF3   (C_INFO)
{
	npc         = Pal_213_Schiffswache;
	nr          = 6;
	condition   = DIA_Pal_213_Schiffswache_IAmKDF3_Condition;
	information = DIA_Pal_213_Schiffswache_IAmKDF3_Info;
	permanent   = FALSE;
	description = "Ты осмелишься атаковать Мага Огня?";
};

FUNC INT DIA_Pal_213_Schiffswache_IAmKDF3_Condition()
{
	if (Hero.guild == GIL_KDF)
	&& (Npc_KnowsInfo (other,DIA_Pal_213_Schiffswache_IAmKDF2))
	{
		return TRUE;
	};
};

FUNC VOID DIA_Pal_213_Schiffswache_IAmKDF3_Info()
{
	AI_Output (other,self ,"DIA_Pal_213_Schiffswache_IAmKDF3_15_00"); //Ты осмелишься атаковать Мага Огня?
	AI_Output (self ,other,"DIA_Pal_213_Schiffswache_IAmKDF3_01_01"); //(нервно) Я никогда не подниму руку на мага.
	AI_Output (other,self ,"DIA_Pal_213_Schiffswache_IAmKDF3_15_02"); //Так что ты все-таки будешь делать, если я взойду на борт?
	AI_Output (self ,other,"DIA_Pal_213_Schiffswache_IAmKDF3_01_03"); //(робко) Ничего, господин.
};

//**********************************************************
//Ich werde jetzt an Bord gehen.
//**********************************************************

INSTANCE DIA_Pal_213_Schiffswache_IAmKDF4   (C_INFO)
{
	npc         = Pal_213_Schiffswache;
	nr          = 6;
	condition   = DIA_Pal_213_Schiffswache_IAmKDF4_Condition;
	information = DIA_Pal_213_Schiffswache_IAmKDF4_Info;
	permanent   = FALSE;
	description = "Тогда я сейчас взойду на борт.";
};

FUNC INT DIA_Pal_213_Schiffswache_IAmKDF4_Condition()
{
	if (Hero.guild == GIL_KDF)
	&& (Npc_KnowsInfo (other,DIA_Pal_213_Schiffswache_IAmKDF3))
	{
		return TRUE;
	};
};

FUNC VOID DIA_Pal_213_Schiffswache_IAmKDF4_Info()
{
	AI_Output (other,self ,"DIA_Pal_213_Schiffswache_IAmKDF4_15_00"); //Тогда я сейчас взойду на борт.
	AI_Output (self ,other,"DIA_Pal_213_Schiffswache_IAmKDF4_01_01"); //(нервно) Ты не должен делать этого, приказы лорда Хагена были вполне конкретными.
};

//**********************************************************
//SchlieЯen Lord Hagen Befehle auch mich mit ein?.
//**********************************************************

INSTANCE DIA_Pal_213_Schiffswache_IAmKDF5   (C_INFO)
{
	npc         = Pal_213_Schiffswache;
	nr          = 6;
	condition   = DIA_Pal_213_Schiffswache_IAmKDF5_Condition;
	information = DIA_Pal_213_Schiffswache_IAmKDF5_Info;
	permanent   = FALSE;
	description = "Приказы лорда Хагена касаются и меня тоже?";
};

FUNC INT DIA_Pal_213_Schiffswache_IAmKDF5_Condition()
{
	if (Hero.guild == GIL_KDF)
	&& (Npc_KnowsInfo (other,DIA_Pal_213_Schiffswache_IAmKDF4))
	{
		return TRUE;
	};
};

FUNC VOID DIA_Pal_213_Schiffswache_IAmKDF5_Info()
{
	AI_Output (other,self ,"DIA_Pal_213_Schiffswache_IAmKDF5_15_00"); //Приказы лорда Хагена касаются и меня тоже?
	AI_Output (self ,other,"DIA_Pal_213_Schiffswache_IAmKDF5_01_01"); //(нервно) Я не знаю.
	AI_Output (other,self ,"DIA_Pal_213_Schiffswache_IAmKDF5_15_02"); //Сам подумай - разве лорд Хаген осмелился бы подозревать мага в воровстве?
	AI_Output (self ,other,"DIA_Pal_213_Schiffswache_IAmKDF5_01_03"); //Я в это не верю.
};

//**********************************************************
//Zum letzten mal: Lass mich auf das Schiff
//**********************************************************

INSTANCE DIA_Pal_213_Schiffswache_IAmKDF6   (C_INFO)
{
	npc         = Pal_213_Schiffswache;
	nr          = 6;
	condition   = DIA_Pal_213_Schiffswache_IAmKDF6_Condition;
	information = DIA_Pal_213_Schiffswache_IAmKDF6_Info;
	permanent   = FALSE;
	description = "В последний раз: позволь мне взойти на корабль!";
};

FUNC INT DIA_Pal_213_Schiffswache_IAmKDF6_Condition()
{
	if (Hero.guild == GIL_KDF)
	&& (Npc_KnowsInfo (other,DIA_Pal_213_Schiffswache_IAmKDF5))
	{
		return TRUE;
	};
};

FUNC VOID DIA_Pal_213_Schiffswache_IAmKDF6_Info()
{
	AI_Output (other,self ,"DIA_Pal_213_Schiffswache_IAmKDF6_15_00"); //В последний раз: позволь мне взойти на корабль!
	AI_Output (self ,other,"DIA_Pal_213_Schiffswache_IAmKDF6_01_01"); //(нервно) Понятно. Ты можешь взойти на корабль.

	MIS_ShipIsFree = TRUE;
	B_StartOtherRoutine	(Girion,"WaitForShip");
};

//**********************************************************
//sc ist PA -Misstraust du mir, Ritter?
//**********************************************************

INSTANCE DIA_Pal_213_Schiffswache_IAmPAL   (C_INFO)
{
	npc         = Pal_213_Schiffswache;
	nr          = 6;
	condition   = DIA_Pal_213_Schiffswache_IAmPAL_Condition;
	information = DIA_Pal_213_Schiffswache_IAmPAL_Info;
	permanent   = FALSE;
	description = "Ты не доверяешь мне, рыцарь?";
};

FUNC INT DIA_Pal_213_Schiffswache_IAmPAL_Condition()
{
	if (Hero.guild == GIL_PAL)
	&& (Npc_KnowsInfo (other,DIA_Pal_213_Schiffswache_GoOnBoard))
	{
		return TRUE;
	};
};

FUNC VOID DIA_Pal_213_Schiffswache_IAmPAL_Info()
{
	AI_Output (other,self ,"DIA_Pal_213_Schiffswache_IAmPAL_15_00"); //Ты не доверяешь мне, рыцарь?
	AI_Output (self ,other,"DIA_Pal_213_Schiffswache_IAmPAL_01_01"); //Никак нет, я просто выполняю приказ.
};

//**********************************************************
//sc ist PA -Dann solltest du wissen, wer hier den Vorgesetzter ist.
//**********************************************************

INSTANCE DIA_Pal_213_Schiffswache_IAmPAL2   (C_INFO)
{
	npc         = Pal_213_Schiffswache;
	nr          = 6;
	condition   = DIA_Pal_213_Schiffswache_IAmPAL2_Condition;
	information = DIA_Pal_213_Schiffswache_IAmPAL2_Info;
	permanent   = FALSE;
	description = "Тогда ты должен знать, кто из нас выше званием.";
};

FUNC INT DIA_Pal_213_Schiffswache_IAmPAL2_Condition()
{
	if (Hero.guild == GIL_PAL)
	&& (Npc_KnowsInfo (other,DIA_Pal_213_Schiffswache_IAmPAL))
	{
		return TRUE;
	};
};

FUNC VOID DIA_Pal_213_Schiffswache_IAmPAL2_Info()
{
	AI_Output (other,self ,"DIA_Pal_213_Schiffswache_IAmPAL2_15_00"); //Тогда ты должен знать, кто из нас выше званием.
	AI_Output (self ,other,"DIA_Pal_213_Schiffswache_IAmPAL2_01_01"); //Так точно!
};

//**********************************************************
//sc ist PA -Dann solltest du wissen, wer hier den Vorgesetzter ist.
//**********************************************************

INSTANCE DIA_Pal_213_Schiffswache_IAmPAL3   (C_INFO)
{
	npc         = Pal_213_Schiffswache;
	nr          = 6;
	condition   = DIA_Pal_213_Schiffswache_IAmPAL3_Condition;
	information = DIA_Pal_213_Schiffswache_IAmPAL3_Info;
	permanent   = FALSE;
	description = "Я приказываю тебе пропустить меня на этот корабль.";
};

FUNC INT DIA_Pal_213_Schiffswache_IAmPAL3_Condition()
{
	if (Hero.guild == GIL_PAL)
	&& (Npc_KnowsInfo (other,DIA_Pal_213_Schiffswache_IAmPAL2))
	{
		return TRUE;
	};
};

FUNC VOID DIA_Pal_213_Schiffswache_IAmPAL3_Info()
{
	AI_Output (other,self ,"DIA_Pal_213_Schiffswache_IAmPAL3_15_00"); //И я приказываю тебе пропустить меня на этот корабль.
	AI_Output (self ,other,"DIA_Pal_213_Schiffswache_IAmPAL3_01_01"); //Есть, сэр, вы можете взойти на корабль.
	
	MIS_ShipIsFree = TRUE;
	B_StartOtherRoutine	(Girion,"WaitForShip");
};

//**********************************************************
//sc ist DJG -Kann man da nichts machen?
//**********************************************************

INSTANCE DIA_Pal_213_Schiffswache_IAmDJG   (C_INFO)
{
	npc         = Pal_213_Schiffswache;
	nr          = 6;
	condition   = DIA_Pal_213_Schiffswache_IAmDJG_Condition;
	information = DIA_Pal_213_Schiffswache_IAmDJG_Info;
	permanent   = FALSE;
	description = "А этот вопрос нельзя как-нибудь решить?";
};

FUNC INT DIA_Pal_213_Schiffswache_IAmDJG_Condition()
{
	if (Hero.guild == GIL_DJG)
	&& (Npc_KnowsInfo (other,DIA_Pal_213_Schiffswache_GoOnBoard))
	{
		return TRUE;
	};
};

FUNC VOID DIA_Pal_213_Schiffswache_IAmDJG_Info()
{
	AI_Output (other,self ,"DIA_Pal_213_Schiffswache_IAmDJG_15_00"); //А этот вопрос нельзя как-нибудь решить?
	AI_Output (self ,other,"DIA_Pal_213_Schiffswache_IAmDJG_01_01"); //Я не понимаю.
};

//**********************************************************
//sc ist DJG -Ich kцnnte dir Geld geben.
//**********************************************************

INSTANCE DIA_Pal_213_Schiffswache_IAmDJG2   (C_INFO)
{
	npc         = Pal_213_Schiffswache;
	nr          = 6;
	condition   = DIA_Pal_213_Schiffswache_IAmDJG2_Condition;
	information = DIA_Pal_213_Schiffswache_IAmDJG2_Info;
	permanent   = FALSE;
	description = "Я могу дать тебе денег.";
};

FUNC INT DIA_Pal_213_Schiffswache_IAmDJG2_Condition()
{
	if (Hero.guild == GIL_DJG)
	&& (Npc_KnowsInfo (other,DIA_Pal_213_Schiffswache_IAmDJG))
	{
		return TRUE;
	};
};

FUNC VOID DIA_Pal_213_Schiffswache_IAmDJG2_Info()
{
	AI_Output (other,self ,"DIA_Pal_213_Schiffswache_IAmDJG2_15_00"); //Я могу дать тебе денег. За то, что ты будешь смотреть в другую сторону.
	AI_Output (self ,other,"DIA_Pal_213_Schiffswache_IAmDJG2_01_01"); //Меня нельзя подкупить, и если ты сейчас не исчезнешь, я сочту это оскорблением.
};

//**********************************************************
//sc ist DJG -Ich habe einen Brief von Lord Hagen.
//**********************************************************

INSTANCE DIA_Pal_213_Schiffswache_IAmDJG3   (C_INFO)
{
	npc         = Pal_213_Schiffswache;
	nr          = 6;
	condition   = DIA_Pal_213_Schiffswache_IAmDJG3_Condition;
	information = DIA_Pal_213_Schiffswache_IAmDJG3_Info;
	permanent   = FALSE;
	description = "У меня письменное разрешение.";
};

FUNC INT DIA_Pal_213_Schiffswache_IAmDJG3_Condition()
{
	if (Hero.guild == GIL_DJG)
	&& (Npc_KnowsInfo (other,DIA_Pal_213_Schiffswache_IAmDJG))
	&& (Npc_HasItems (other,ITWr_ForgedShipLetter_MIS) >=1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Pal_213_Schiffswache_IAmDJG3_Info()
{
	AI_Output (other,self ,"DIA_Pal_213_Schiffswache_IAmDJG3_15_00"); //У меня письменное разрешение. Я уполномочен взойти на этот корабль.
	AI_Output (self ,other,"DIA_Pal_213_Schiffswache_IAmDJG3_01_01"); //Дай я взгляну.
	
	B_GiveInvItems (other,self,ItWr_ForgedShipLetter_Mis,1);
	B_UseFakeScroll ();
	
	AI_Output (self ,other,"DIA_Pal_213_Schiffswache_IAmDJG3_01_02"); //Все правильно, ты можешь пройти.
	
	MIS_ShipIsFree = TRUE;
	B_StartOtherRoutine	(Girion,"WaitForShip");
};





