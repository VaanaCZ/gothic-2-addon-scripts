// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Keroloth_EXIT(C_INFO)
{
	npc			= PAL_258_Keroloth;
	nr			= 999;
	condition	= DIA_Keroloth_EXIT_Condition;
	information	= DIA_Keroloth_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Keroloth_EXIT_Condition()
{
	if (Kapitel < 3)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Keroloth_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

//**************************************************************
//	Ansprechen 
//**************************************************************
INSTANCE DIA_Keroloth_HELLO(C_INFO)
{
	npc			= PAL_258_Keroloth;
	nr			= 2;
	condition	= DIA_Keroloth_HELLO_Condition;
	information	= DIA_Keroloth_HELLO_Info;
	permanent	= FALSE;
	important	= TRUE;	
};                       

FUNC INT DIA_Keroloth_HELLO_Condition()
{
	if Npc_IsInState (self,ZS_Talk)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Keroloth_HELLO_Info()
{	
	AI_Output	(other ,self,"DIA_Keroloth_HELLO_15_00"); //Ты тренируешь людей?
	AI_Output	(self ,other,"DIA_Keroloth_HELLO_07_01"); //Да. Когда эти орки или, что еще хуже, драконы, нападут опять, нам понадобится каждый меч.
};
//***********************************************
//	Kannst DU mir was beibringen
//***********************************************

INSTANCE DIA_Keroloth_WantTeach(C_INFO)
{
	npc			= PAL_258_Keroloth;
	nr			= 3;
	condition	= DIA_Keroloth_WantTeach_Condition;
	information	= DIA_Keroloth_WantTeach_Info;
	permanent	= FALSE;
	description = "Ты можешь обучить и меня?";
};                       

FUNC INT DIA_Keroloth_WantTeach_Condition()
{
	if (Keroloths_BeutelLeer == FALSE)
	{
	 	return TRUE;
	};
};
 
FUNC VOID DIA_Keroloth_WantTeach_Info()
{	
	AI_Output 	(other,self ,"DIA_Keroloth_WantTeach_15_00"); //Ты можешь обучить и меня?
	AI_Output 	(self ,other,"DIA_Keroloth_WantTeach_07_01"); //Конечно. Я тренирую всех.
	AI_Output 	(self ,other,"DIA_Keroloth_WantTeach_07_02"); //Но кроме таланта тебе понадобится хорошее оружие, если ты хочешь выжить здесь.
	AI_Output 	(self ,other,"DIA_Keroloth_WantTeach_07_03"); //Обратись к рыцарю Тандору. Он снарядит тебя.
		
	Keroloth_TeachPlayer = TRUE;
	Log_CreateTopic (TOPIC_Teacher_OC,LOG_NOTE);
	B_LogEntry (TOPIC_Teacher_OC,"Керолот тренирует мечников в замке.");
	
	Log_CreateTopic (TOPIC_Trader_OC,LOG_NOTE);
	B_LogEntry (TOPIC_Trader_OC,"Тандор продает оружие в замке.");
};
//***********************************************
//	Kampflehrer EINHAND
//***********************************************

INSTANCE DIA_Keroloth_Teacher(C_INFO)
{
	npc			= PAL_258_Keroloth;
	nr			= 6;
	condition	= DIA_Keroloth_Teacher_Condition;
	information	= DIA_Keroloth_Teacher_Info;
	permanent	= TRUE;
	description = "(Изучить бой одноручным оружием)";
};                       

FUNC INT DIA_Keroloth_Teacher_Condition()
{
	if (Keroloth_TeachPlayer == TRUE)
	&& (Keroloths_BeutelLeer == FALSE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Keroloth_Teacher_Info()
{	
	AI_Output 	(other,self ,"DIA_Keroloth_Teacher_15_00"); //Я хочу тренироваться!
	
	Info_ClearChoices 	(DIA_Keroloth_Teacher);
	Info_AddChoice 		(DIA_Keroloth_Teacher,DIALOG_BACK,DIA_Keroloth_Teacher_Back);
	Info_AddChoice		(DIA_Keroloth_Teacher, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1))			,DIA_Keroloth_Teacher_1H_1);
	Info_AddChoice		(DIA_Keroloth_Teacher, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5))			,DIA_Keroloth_Teacher_1H_5);
};

FUNC VOID DIA_Keroloth_Teacher_Back ()
{
	Info_ClearChoices (DIA_Keroloth_Teacher);
};

FUNC VOID B_Keroloth_TeachNoMore1 ()
{
	AI_Output(self,other,"B_Keroloth_TeachNoMore1_07_00"); //Ты очень хорош. Мне больше нечему учить тебя.
};

FUNC VOID B_Keroloth_TeachNoMore2 ()
{
	AI_Output(self,other,"B_Keroloth_TeachNoMore2_07_00"); //Только очень опытный мечник сможет помочь тебе теперь.
};

FUNC VOID DIA_Keroloth_Teacher_1H_1 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_1H, 1, 60);
	
	if (other.HitChance[NPC_TALENT_1H] >= 60)
	{
		B_Keroloth_TeachNoMore1	();
		
		if (Npc_GetTalentSkill (other, NPC_TALENT_1H) == 2)
		{
			B_Keroloth_TeachNoMore2	();
		};
	};
	Info_AddChoice		(DIA_Keroloth_Teacher, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1))			,DIA_Keroloth_Teacher_1H_1);
};

FUNC VOID DIA_Keroloth_Teacher_1H_5 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_1H, 5, 60);
	
	if (other.HitChance[NPC_TALENT_1H] >= 60)
	{
		B_Keroloth_TeachNoMore1	();
		
		if (Npc_GetTalentSkill (other, NPC_TALENT_1H) == 2)
		{
			B_Keroloth_TeachNoMore2	();
		};
	};
	Info_AddChoice		(DIA_Keroloth_Teacher, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5))			,DIA_Keroloth_Teacher_1H_5);
};
//**************************************
//		Kampflehrer ZWEIHAND
//**************************************
INSTANCE DIA_Keroloth_Teach(C_INFO)
{
	npc			= PAL_258_Keroloth;
	nr			= 100;
	condition	= DIA_Keroloth_Teach_Condition;
	information	= DIA_Keroloth_Teach_Info;
	permanent	= TRUE;
	description = "(Изучить бой двуручным оружием)";
};                       
//----------------------------------
var int DIA_Keroloth_Teach_permanent;
//----------------------------------
FUNC INT DIA_Keroloth_Teach_Condition()
{
	if (Keroloth_TeachPlayer == TRUE)
	&& (Keroloths_BeutelLeer == FALSE)
	&& (DIA_Keroloth_Teach_permanent == FALSE)
	&& (other.HitChance[NPC_TALENT_2H] < 60)
	{
		return TRUE;
	};	
};
 
FUNC VOID DIA_Keroloth_Teach_Info()
{	
	AI_Output (other,self ,"DIA_Keroloth_Teach_15_00"); //Начнем.
	
	Info_ClearChoices 	(DIA_Keroloth_Teach);
	Info_AddChoice 		(DIA_Keroloth_Teach,	DIALOG_BACK		,DIA_Keroloth_Teach_Back);
	Info_AddChoice		(DIA_Keroloth_Teach, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))			,DIA_Keroloth_Teach_2H_1);
	Info_AddChoice		(DIA_Keroloth_Teach, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5))			,DIA_Keroloth_Teach_2H_5);

};
FUNC VOID DIA_Keroloth_Teach_Back ()
{
	if (other.HitChance[NPC_TALENT_2H] >= 60)
	{
		B_Keroloth_TeachNoMore1	();
		
		DIA_Keroloth_Teach_permanent = TRUE;
	};
	Info_ClearChoices (DIA_Keroloth_Teach);
};

FUNC VOID DIA_Keroloth_Teach_2H_1 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_2H, 1, 60);
	
	Info_ClearChoices 	(DIA_Keroloth_Teach);
	Info_AddChoice 		(DIA_Keroloth_Teach,	DIALOG_BACK		,DIA_Keroloth_Teach_Back);
	Info_AddChoice		(DIA_Keroloth_Teach, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))			,DIA_Keroloth_Teach_2H_1);	
	Info_AddChoice		(DIA_Keroloth_Teach, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5))			,DIA_Keroloth_Teach_2H_5);	
};

FUNC VOID DIA_Keroloth_Teach_2H_5 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_2H, 5, 60);
	
	Info_ClearChoices 	(DIA_Keroloth_Teach);
	Info_AddChoice 		(DIA_Keroloth_Teach,	DIALOG_BACK		,DIA_Keroloth_Teach_Back);
	Info_AddChoice		(DIA_Keroloth_Teach, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))			,DIA_Keroloth_Teach_2H_1);	
	Info_AddChoice		(DIA_Keroloth_Teach, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5))			,DIA_Keroloth_Teach_2H_5);	
};
//************************************
//	Suche andere Lehrer
//************************************

INSTANCE DIA_Keroloth_Udar(C_INFO)
{
	npc			= PAL_258_Keroloth;
	nr			= 4;
	condition	= DIA_Keroloth_Udar_Condition;
	information	= DIA_Keroloth_Udar_Info;
	permanent	= FALSE;
	description = "Что насчет дальнего боя?";
};                       

FUNC INT DIA_Keroloth_Udar_Condition()
{
	if (Keroloth_TeachPlayer == TRUE)
	&& (Keroloths_BeutelLeer == FALSE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Keroloth_Udar_Info()
{	
	AI_Output 	(other,self ,"DIA_Keroloth_Udar_15_00"); //Что насчет дальнего боя?
	AI_Output	(self ,other,"DIA_Keroloth_Udar_07_01"); //Что насчет него?
	AI_Output 	(other,self ,"DIA_Keroloth_Udar_15_02"); //Ты можешь обучить меня ему?
	AI_Output	(self ,other,"DIA_Keroloth_Udar_07_03"); //Нет, но ты можешь попросить Удара. Он хороший - нет, он ЛУЧШИЙ арбалетчик, насколько я знаю.
	
	
	Log_CreateTopic	(TOPIC_Teacher_OC, LOG_NOTE);
	B_LogEntry		(TOPIC_Teacher_OC, "Удар, из замка Долины рудников, знает все об арбалетах.");
};
//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP3
// ************************************************************

INSTANCE DIA_Keroloth_KAP3_EXIT(C_INFO)
{
	npc			= PAL_258_Keroloth;
	nr			= 999;
	condition	= DIA_Keroloth_KAP3_EXIT_Condition;
	information	= DIA_Keroloth_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Keroloth_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Keroloth_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################


// ************************************************************
// 	  				   EXIT KAP4
// ************************************************************

INSTANCE DIA_Keroloth_KAP4_EXIT(C_INFO)
{
	npc			= PAL_258_Keroloth;
	nr			= 999;
	condition	= DIA_Keroloth_KAP4_EXIT_Condition;
	information	= DIA_Keroloth_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Keroloth_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Keroloth_KAP4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Kap4_Hello
///////////////////////////////////////////////////////////////////////
instance DIA_Keroloth_KAP4_HELLO		(C_INFO)
{
	npc		 = 	PAL_258_Keroloth;
	nr		 = 	40;
	condition	 = 	DIA_Keroloth_KAP4_HELLO_Condition;
	information	 = 	DIA_Keroloth_KAP4_HELLO_Info;

	description	 = 	"У тебя такой расстроенный вид.";
};

func int DIA_Keroloth_KAP4_HELLO_Condition ()
{
	if (Kapitel >= 4)	
		{
				return TRUE;
		};
};

func void DIA_Keroloth_KAP4_HELLO_Info ()
{
	AI_Output			(other, self, "DIA_Keroloth_KAP4_HELLO_15_00"); //У тебя такой расстроенный вид.
	AI_Output			(self, other, "DIA_Keroloth_KAP4_HELLO_07_01"); //(возбужденно) Будь они прокляты. Мой тебе совет: глаз не спускай со своих вещей.
	AI_Output			(self, other, "DIA_Keroloth_KAP4_HELLO_07_02"); //Чуть отвернешься, и все - вещички уже увели. Вот подонки!

	Info_AddChoice	(DIA_Keroloth_KAP4_HELLO, DIALOG_BACK, DIA_Keroloth_KAP4_HELLO_ende );
	Info_AddChoice	(DIA_Keroloth_KAP4_HELLO, "Паладин не должен так просто выходить из себя.", DIA_Keroloth_KAP4_HELLO_ruhig );
 	Info_AddChoice	(DIA_Keroloth_KAP4_HELLO, "У тебя что-то украли?", DIA_Keroloth_KAP4_HELLO_bestohlen );
	Info_AddChoice	(DIA_Keroloth_KAP4_HELLO, "Что за подонки?", DIA_Keroloth_KAP4_HELLO_pack );


};
func void DIA_Keroloth_KAP4_HELLO_ende ()
{
	Info_ClearChoices	(DIA_Keroloth_KAP4_HELLO);
};

func void DIA_Keroloth_KAP4_HELLO_bestohlen ()
{
	AI_Output			(other, self, "DIA_Keroloth_KAP4_HELLO_bestohlen_15_00"); //У тебя что-то украли?
	AI_Output			(self, other, "DIA_Keroloth_KAP4_HELLO_bestohlen_07_01"); //Нет. Они положили 20 золотых в мой карман. Конечно же, меня обокрали, ты, идиот!
	AI_Output			(self, other, "DIA_Keroloth_KAP4_HELLO_bestohlen_07_02"); //Ничего, когда я доберусь до этой сволочи...

	Info_AddChoice	(DIA_Keroloth_KAP4_HELLO, "Так что у тебя пропало?", DIA_Keroloth_KAP4_HELLO_bestohlen_wasfehlt );
};
func void DIA_Keroloth_KAP4_HELLO_bestohlen_wasfehlt ()
{
	AI_Output			(other, self, "DIA_Keroloth_KAP4_HELLO_bestohlen_wasfehlt_15_00"); //Так что у тебя пропало?
	AI_Output			(self, other, "DIA_Keroloth_KAP4_HELLO_bestohlen_wasfehlt_07_01"); //Мой кошелек, со всеми моими сбережениями.
	AI_Output			(self, other, "DIA_Keroloth_KAP4_HELLO_bestohlen_wasfehlt_07_02"); //Его украли!
	AI_Output			(other, self, "DIA_Keroloth_KAP4_HELLO_bestohlen_wasfehlt_15_03"); //Он где-нибудь всплывет.
	AI_Output			(self, other, "DIA_Keroloth_KAP4_HELLO_bestohlen_wasfehlt_07_04"); //Когда я доберусь до него...

	Log_CreateTopic (TOPIC_KerolothsGeldbeutel, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KerolothsGeldbeutel, LOG_RUNNING);
	B_LogEntry (TOPIC_KerolothsGeldbeutel,"Паладин Керолот потерял свой кошелек. Он утверждает, что его украли охотники на драконов."); 


	Info_ClearChoices	(DIA_Keroloth_KAP4_HELLO);
};

func void DIA_Keroloth_KAP4_HELLO_pack ()
{
	AI_Output			(other, self, "DIA_Keroloth_KAP4_HELLO_pack_15_00"); //Что за подонки?
	
	if (hero.guild == GIL_DJG)
		{
			AI_Output			(self, other, "DIA_Keroloth_KAP4_HELLO_pack_07_01"); //Вы, оборванцы, охотники на драконов, конечно. Кто еще?
		}
	else
		{
			AI_Output			(self, other, "DIA_Keroloth_KAP4_HELLO_pack_07_02"); //Этот сброд, называющий себя охотниками на драконов, конечно. А кого еще, как ты думаешь, я могу иметь в виду?
		};
		
	AI_Output			(self, other, "DIA_Keroloth_KAP4_HELLO_pack_07_03"); //(себе под нос) Нужно быть бдительным, это я тебе говорю.
};

func void DIA_Keroloth_KAP4_HELLO_ruhig ()
{
	AI_Output			(other, self, "DIA_Keroloth_KAP4_HELLO_ruhig_15_00"); //Успокойся! Паладин не должен так просто выходить из себя.
	AI_Output			(self, other, "DIA_Keroloth_KAP4_HELLO_ruhig_07_01"); //Но я не хочу успокаиваться. Это были все мои сбережения, черт!
};


///////////////////////////////////////////////////////////////////////
//	Info GELDGEFUNDEN
///////////////////////////////////////////////////////////////////////
instance DIA_Keroloth_KAP4_GELDGEFUNDEN		(C_INFO)
{
	npc		 = 	PAL_258_Keroloth;
	nr		 = 	42;
	condition	 = 	DIA_Keroloth_KAP4_GELDGEFUNDEN_Condition;
	information	 = 	DIA_Keroloth_KAP4_GELDGEFUNDEN_Info;

	description	 = 	"Я думаю, я нашел твой кошелек.";
};

func int DIA_Keroloth_KAP4_GELDGEFUNDEN_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Keroloth_KAP4_HELLO))
		&& 	(
			(Npc_HasItems (other,ItMi_KerolothsGeldbeutel_MIS))
			|| (Npc_HasItems (other,ItMi_KerolothsGeldbeutelLeer_MIS))
			)		
		{
				return TRUE;
		};
};

func void DIA_Keroloth_KAP4_GELDGEFUNDEN_Info ()
{
	AI_Output			(other, self, "DIA_Keroloth_KAP4_GELDGEFUNDEN_15_00"); //Я думаю, я нашел твой кошелек.
	TOPIC_END_KerolothsGeldbeutel = TRUE;
	B_GivePlayerXP (XP_KerolothsGeldbeutel);
	if (B_GiveInvItems (other, self, ItMi_KerolothsGeldbeutelLeer_MIS,1))
	{
		AI_Output			(self, other, "DIA_Keroloth_KAP4_GELDGEFUNDEN_07_01"); //Кошелек пуст. Какая свинья сделала это?
	
		Keroloths_BeutelLeer = TRUE;
	};
	if (B_GiveInvItems (other, self, ItMi_KerolothsGeldbeutel_MIS,1))
	{
		AI_Output			(self, other, "DIA_Keroloth_KAP4_GELDGEFUNDEN_07_02"); //Что? Где? Какой ублюдок сделал это?
	};
	
	if (hero.guild == GIL_DJG)
	{
		Info_AddChoice	(DIA_Keroloth_KAP4_GELDGEFUNDEN, "Минутку. А как насчет награды?", DIA_Keroloth_KAP4_GELDGEFUNDEN_Lohn );
	};

	Info_AddChoice	(DIA_Keroloth_KAP4_GELDGEFUNDEN, "Он был вон там, у кузницы.", DIA_Keroloth_KAP4_GELDGEFUNDEN_Schmiede );
	Info_AddChoice	(DIA_Keroloth_KAP4_GELDGEFUNDEN, "Я подозреваю одного охотника на драконов.", DIA_Keroloth_KAP4_GELDGEFUNDEN_DJG );
	Info_AddChoice	(DIA_Keroloth_KAP4_GELDGEFUNDEN, "Откуда мне знать?", DIA_Keroloth_KAP4_GELDGEFUNDEN_keineAhnung);
};
func void DIA_Keroloth_KAP4_GELDGEFUNDEN_keineAhnung ()
{
	AI_Output			(other, self, "DIA_Keroloth_KAP4_GELDGEFUNDEN_keineAhnung_15_00"); //Откуда мне знать?

	if (hero.guild == GIL_DJG)
	{
		AI_Output			(self, other, "DIA_Keroloth_KAP4_GELDGEFUNDEN_keineAhnung_07_01"); //Ты пытаешься надуть меня? Это ведь был ты, признайся.
		
		Info_ClearChoices	(DIA_Keroloth_KAP4_GELDGEFUNDEN);
		Info_AddChoice	(DIA_Keroloth_KAP4_GELDGEFUNDEN, "Я подозреваю одного охотника на драконов.", DIA_Keroloth_KAP4_GELDGEFUNDEN_DJG );
		Info_AddChoice	(DIA_Keroloth_KAP4_GELDGEFUNDEN, "Поцелуй мою задницу.", DIA_Keroloth_KAP4_GELDGEFUNDEN_keineAhnung_kannstmich );
	}
	else
	{
		AI_Output			(self, other, "DIA_Keroloth_KAP4_GELDGEFUNDEN_keineAhnung_07_02"); //Я еще это выясню.
		AI_StopProcessInfos (self);
	};
};
func void DIA_Keroloth_KAP4_GELDGEFUNDEN_keineAhnung_kannstmich ()
{
	AI_Output			(other, self, "DIA_Keroloth_KAP4_kannstmich_15_00"); //Поцелуй мою задницу.
	AI_Output			(self, other, "DIA_Keroloth_KAP4_kannstmich_07_01"); //Я покажу тебе, как воровать  честных людей!

	AI_StopProcessInfos	(self);
	B_Attack (self, other, AR_NONE, 1);	
};

func void DIA_Keroloth_KAP4_GELDGEFUNDEN_DJG ()
{
	AI_Output			(other, self, "DIA_Keroloth_KAP4_GELDGEFUNDEN_DJG_15_00"); //Я подозреваю одного охотника на драконов.
		
	AI_Output			(self, other, "DIA_Keroloth_KAP4_GELDGEFUNDEN_DJG_07_01"); //(зло) Я знал это.
	
	if (hero.guild == GIL_DJG)
		{
			AI_Output			(self, other, "DIA_Keroloth_KAP4_GELDGEFUNDEN_DJG_07_02"); //(рычит) Их вообще не стоило пускать в замок.
		}
		else
		{
			AI_Output			(self, other, "DIA_Keroloth_KAP4_GELDGEFUNDEN_DJG_07_03"); //Ну, подожди, я покажу этой свинье...
		};

	AI_StopProcessInfos	(self);
	other.aivar[AIV_INVINCIBLE] = FALSE;

	if (Npc_IsDead(Ferros) == FALSE)
		&& ((Npc_GetDistToNpc(self, Ferros)) <= 2000)
		{
			B_Attack (self, Ferros, AR_NONE, 1);
		}
	else if (Npc_IsDead(Jan) == FALSE)
		&& ((Npc_GetDistToNpc(self, Jan)) <= 2000)
		{
			B_Attack (self, Jan, AR_NONE, 1);
		}
	else if (Npc_IsDead(Rethon) == FALSE)
		&& ((Npc_GetDistToNpc(self, Rethon)) <= 2000)
		{
			B_Attack (self, Rethon, AR_NONE, 1);
		};
};

func void DIA_Keroloth_KAP4_GELDGEFUNDEN_Schmiede ()
{
	AI_Output			(other, self, "DIA_Keroloth_KAP4_GELDGEFUNDEN_Schmiede_15_00"); //Эээ. Он был вон там, у кузницы.
	AI_Output			(self, other, "DIA_Keroloth_KAP4_GELDGEFUNDEN_Schmiede_07_01"); //Где? У кузницы? Он, должно быть, выпал там из кармана какого-нибудь охотника на драконов. Только не говори мне, что это не так.
};

func void DIA_Keroloth_KAP4_GELDGEFUNDEN_Lohn ()
{
	AI_Output			(other, self, "DIA_Keroloth_KAP4_GELDGEFUNDEN_Lohn_15_00"); //Минутку. А как насчет награды?
	
 	if (Keroloths_BeutelLeer == TRUE)
	{
		AI_Output			(self, other, "DIA_Keroloth_KAP4_GELDGEFUNDEN_Lohn_07_01"); //Это была последняя капля. Ты, похоже, давно не получал по морде, а?
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_NONE, 1);	
	}
	else
	{
		AI_Output			(self, other, "DIA_Keroloth_KAP4_GELDGEFUNDEN_Lohn_07_02"); //А-аа. Хорошо. Вот несколько монет. А теперь скажи мне, кто сделал это?
		CreateInvItems (self, ItMi_Gold, 50);									
		B_GiveInvItems (self, other, ItMi_Gold, 50);					
		Keroloth_HasPayed = TRUE;
	};
};

///////////////////////////////////////////////////////////////////////
//	Info belohnung
///////////////////////////////////////////////////////////////////////
instance DIA_Keroloth_KAP4_BELOHNUNG		(C_INFO)
{
	npc		 = 	PAL_258_Keroloth;
	nr		 = 	43;
	condition	 = 	DIA_Keroloth_KAP4_BELOHNUNG_Condition;
	information	 = 	DIA_Keroloth_KAP4_BELOHNUNG_Info;
	permanent	 = 	TRUE;

	description	 = 	"Я хочу получить честные комиссионные за эту находку.";
};

func int DIA_Keroloth_KAP4_BELOHNUNG_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Keroloth_KAP4_GELDGEFUNDEN))
 		&& (Keroloth_HasPayed == FALSE)
 		&& (hero.guild != GIL_KDF)
 		{
				return TRUE;
		};
};

func void DIA_Keroloth_KAP4_BELOHNUNG_Info ()
{
 	AI_Output			(other, self, "DIA_Keroloth_KAP4_BELOHNUNG_15_00"); //Я хочу получить честные комиссионные за эту находку.

	if ((Keroloths_BeutelLeer == TRUE) || (hero.guild == GIL_DJG))
	{
		AI_Output			(self, other, "DIA_Keroloth_KAP4_BELOHNUNG_07_01"); //Да, а рискуешь получить удар в челюсть!
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_NONE, 1);	
	}
	else
	{
		AI_Output			(self, other, "DIA_Keroloth_KAP4_BELOHNUNG_07_02"); //Это все, что тебе нужно? Вот пара монет. А теперь проваливай.
		
		CreateInvItems (self, ItMi_Gold, 50);									
		B_GiveInvItems (self, other, ItMi_Gold, 50);					
		
		Keroloth_HasPayed = TRUE;
	};
};

///////////////////////////////////////////////////////////////////////
//	Info entspanndich
///////////////////////////////////////////////////////////////////////
instance DIA_Keroloth_KAP4_ENTSPANNDICH		(C_INFO)
{
	npc		 = 	PAL_258_Keroloth;
	nr		 = 	44;
	condition	 = 	DIA_Keroloth_KAP4_ENTSPANNDICH_Condition;
	information	 = 	DIA_Keroloth_KAP4_ENTSPANNDICH_Info;
	permanent	 = 	TRUE;

	description	 = 	"Расслабься.";
};

func int DIA_Keroloth_KAP4_ENTSPANNDICH_Condition ()
{
	if ((Npc_KnowsInfo(other, DIA_Keroloth_KAP4_GELDGEFUNDEN))
		&& (Kapitel >= 4))
		|| (MIS_OCGateOpen == TRUE)
		{
				return TRUE;
		};
};

func void DIA_Keroloth_KAP4_ENTSPANNDICH_Info ()
{
	AI_Output			(other, self, "DIA_Keroloth_KAP4_ENTSPANNDICH_15_00"); //Расслабься.
	
	if (hero.guild == GIL_KDF)
	{
	AI_Output			(self, other, "DIA_Keroloth_KAP4_ENTSPANNDICH_07_01"); //Да, мастер. Я попытаюсь.
	}
	else if (MIS_OCGateOpen == TRUE)
	{
	AI_Output			(self, other, "DIA_Keroloth_KAP4_ENTSPANNDICH_07_02"); //Я не могу доказать это, но мне кажется, что ты предатель, который открыл ворота.
	AI_Output			(self, other, "DIA_Keroloth_KAP4_ENTSPANNDICH_07_03"); //Ты заплатишь за это!
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE, 1);	
	}
	else 
	{
	AI_Output			(other, self, "DIA_Keroloth_KAP4_ENTSPANNDICH_15_04"); //Ты ведь получил свой кошелек назад, разве нет?
	AI_Output			(self, other, "DIA_Keroloth_KAP4_ENTSPANNDICH_07_05"); //Не провоцируй меня! Проваливай!
	AI_StopProcessInfos (self);
	};
};

//#####################################################################
//##
//##
//##							KAPITEL 5
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP5
// ************************************************************

INSTANCE DIA_Keroloth_KAP5_EXIT(C_INFO)
{
	npc			= PAL_258_Keroloth;
	nr			= 999;
	condition	= DIA_Keroloth_KAP5_EXIT_Condition;
	information	= DIA_Keroloth_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Keroloth_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Keroloth_KAP5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


//#####################################################################
//##
//##
//##							KAPITEL 6
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP6
// ************************************************************


INSTANCE DIA_Keroloth_KAP6_EXIT(C_INFO)
{
	npc			= PAL_258_Keroloth;
	nr			= 999;
	condition	= DIA_Keroloth_KAP6_EXIT_Condition;
	information	= DIA_Keroloth_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Keroloth_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Keroloth_KAP6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};




// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Keroloth_PICKPOCKET (C_INFO)
{
	npc			= PAL_258_Keroloth;
	nr			= 900;
	condition	= DIA_Keroloth_PICKPOCKET_Condition;
	information	= DIA_Keroloth_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Keroloth_PICKPOCKET_Condition()
{
	C_Beklauen (25, 45);
};
 
FUNC VOID DIA_Keroloth_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Keroloth_PICKPOCKET);
	Info_AddChoice		(DIA_Keroloth_PICKPOCKET, DIALOG_BACK 		,DIA_Keroloth_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Keroloth_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Keroloth_PICKPOCKET_DoIt);
};

func void DIA_Keroloth_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Keroloth_PICKPOCKET);
};
	
func void DIA_Keroloth_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Keroloth_PICKPOCKET);
};




















































