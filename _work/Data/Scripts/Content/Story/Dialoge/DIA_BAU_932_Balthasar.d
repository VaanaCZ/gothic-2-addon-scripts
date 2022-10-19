///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Balthasar_EXIT   (C_INFO)
{
	npc         = BAU_932_Balthasar;
	nr          = 999;
	condition   = DIA_Balthasar_EXIT_Condition;
	information = DIA_Balthasar_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Balthasar_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Balthasar_EXIT_Info()
{
	AI_StopProcessInfos (self);
};


///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Balthasar_HALLO		(C_INFO)
{
	npc		 = 	BAU_932_Balthasar;
	nr		 = 	3;
	condition	 = 	DIA_Balthasar_HALLO_Condition;
	information	 = 	DIA_Balthasar_HALLO_Info;

	description	 = 	"How are things?";
};

func int DIA_Balthasar_HALLO_Condition ()
{
	return TRUE;
};

func void DIA_Balthasar_HALLO_Info ()
{
	AI_Output			(other, self, "DIA_Balthasar_HALLO_15_00"); //How are things?
	AI_Output			(self, other, "DIA_Balthasar_HALLO_05_01"); //Ah, a new face here on the farm. Has the old skinflint finally granted me an apprentice?
	AI_Output			(other, self, "DIA_Balthasar_HALLO_15_02"); //I'm not an apprentice.
	AI_Output			(self, other, "DIA_Balthasar_HALLO_05_03"); //Oh. I see. I'm not as young as I used to be, you know? And I've been waiting for a replacement for years.
	AI_Output			(self, other, "DIA_Balthasar_HALLO_05_04"); //You aren't here because the neighbors are annoyed, are you?
	

};

///////////////////////////////////////////////////////////////////////
//	Info wasmachstdu
///////////////////////////////////////////////////////////////////////
instance DIA_Balthasar_WASMACHSTDU		(C_INFO)
{
	npc		 = 	BAU_932_Balthasar;
	nr		 = 	4;
	condition	 = 	DIA_Balthasar_WASMACHSTDU_Condition;
	information	 = 	DIA_Balthasar_WASMACHSTDU_Info;

	description	 = 	"What's the work you do here?";
};

func int DIA_Balthasar_WASMACHSTDU_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Balthasar_HALLO))
		{
				return TRUE;
		};
};

func void DIA_Balthasar_WASMACHSTDU_Info ()
{
	AI_Output			(other, self, "DIA_Balthasar_WASMACHSTDU_15_00"); //What's the work you do here?
	AI_Output			(self, other, "DIA_Balthasar_WASMACHSTDU_05_01"); //Oh, I guard the sheep, and I've been doing that for as long as I can remember.
	AI_Output			(self, other, "DIA_Balthasar_WASMACHSTDU_05_02"); //The animals are very loyal and very smart, you see. If you treat them well, they'll follow you for a lifetime.

};

///////////////////////////////////////////////////////////////////////
//	Info Rangerbandits
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Balthasar_Rangerbandits		(C_INFO)
{
	npc		 = 	BAU_932_Balthasar;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Balthasar_Rangerbandits_Condition;
	information	 = 	DIA_Addon_Balthasar_Rangerbandits_Info;

	description	 = 	"Have you seen any bandits passing through here?";
};

func int DIA_Addon_Balthasar_Rangerbandits_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Balthasar_HALLO))
	&& (
		(MIS_Vatras_FindTheBanditTrader == LOG_RUNNING)		
		||(SC_KnowsLuciaCaughtByBandits == TRUE)
		)
		{
			return TRUE;
		};
};

func void DIA_Addon_Balthasar_Rangerbandits_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Balthasar_Rangerbandits_15_00"); //Have you seen any bandits passing through here?
	AI_Output	(self, other, "DIA_Addon_Balthasar_Rangerbandits_05_01"); //I certainly have. They passed along the edge of the field near Sekob's farm and entered the forest to the north.
	
	if (MIS_Vatras_FindTheBanditTrader == LOG_RUNNING)	
	{
		AI_Output	(self, other, "DIA_Addon_Balthasar_Rangerbandits_05_02"); //They were carrying loads of weapons. They looked like they were all set to win the war against the orcs.
	};
	
	if (SC_KnowsLuciaCaughtByBandits == TRUE)
	{
		AI_Output	(self, other, "DIA_Addon_Balthasar_Rangerbandits_05_03"); //If my eyes didn't deceive me, they were also dragging a young woman along to the forest.
		AI_Output	(self, other, "DIA_Addon_Balthasar_Rangerbandits_05_04"); //I really hope they left her alone.
	};
	B_GivePlayerXP (XP_Ambient);
	AI_Output	(self, other, "DIA_Addon_Balthasar_Rangerbandits_05_05"); //I'm just glad they stayed away from our farm.
};

///////////////////////////////////////////////////////////////////////
//	Info aergermitnachbarn
///////////////////////////////////////////////////////////////////////
instance DIA_Balthasar_AERGERMITNACHBARN		(C_INFO)
{
	npc		 = 	BAU_932_Balthasar;
	nr		 = 	5;
	condition	 = 	DIA_Balthasar_AERGERMITNACHBARN_Condition;
	information	 = 	DIA_Balthasar_AERGERMITNACHBARN_Info;

	description	 = 	"What's the trouble with your neighbors?";
};

func int DIA_Balthasar_AERGERMITNACHBARN_Condition ()
{
	if (
		(Npc_KnowsInfo(other, DIA_Balthasar_WASMACHSTDU))
		&& ((hero.guild == GIL_NONE)||(hero.guild == GIL_SLD)||(hero.guild == GIL_DJG))
		&& 	(
			((Npc_IsDead(BalthasarSheep1))== FALSE)
			|| ((Npc_IsDead(BalthasarSheep2))== FALSE)
			|| ((Npc_IsDead(BalthasarSheep3))== FALSE)
			)
		)
			{
					return TRUE;
			};
};

func void DIA_Balthasar_AERGERMITNACHBARN_Info ()
{
	AI_Output			(other, self, "DIA_Balthasar_AERGERMITNACHBARN_15_00"); //What's the trouble with your neighbors?
	AI_Output			(self, other, "DIA_Balthasar_AERGERMITNACHBARN_05_01"); //The grass on this side of the big field is always so stunted and dry. So I mostly go to the big pastures of the other farmers.
	AI_Output			(self, other, "DIA_Balthasar_AERGERMITNACHBARN_05_02"); //The landowner doesn't mind, but Bengar, the farmer on the high pastures, always makes a huge deal out of it when I take the animals up there.
	AI_Output			(self, other, "DIA_Balthasar_AERGERMITNACHBARN_05_03"); //He says Sekob should pay if I take his animals onto Bengar's pasture.
	AI_Output			(self, other, "DIA_Balthasar_AERGERMITNACHBARN_05_04"); //But Sekob won't spend a measly coin for that, so I can't go up onto the plateau anymore.
};

///////////////////////////////////////////////////////////////////////
//	Info woBengar
///////////////////////////////////////////////////////////////////////
instance DIA_Balthasar_WOBENGAR		(C_INFO)
{
	npc		 = 	BAU_932_Balthasar;
	nr		 = 	10;
	condition	 = 	DIA_Balthasar_WOBENGAR_Condition;
	information	 = 	DIA_Balthasar_WOBENGAR_Info;

	description	 = 	"Where can I find the high pastures and Bengar's farm?";
};

func int DIA_Balthasar_WOBENGAR_Condition ()
{
	if 	(Npc_KnowsInfo(other, DIA_Balthasar_AERGERMITNACHBARN))
		&& ((hero.guild == GIL_NONE)||(hero.guild == GIL_SLD)||(hero.guild == GIL_DJG))
			{
				return TRUE;
			};
};

func void DIA_Balthasar_WOBENGAR_Info ()
{
	AI_Output			(other, self, "DIA_Balthasar_WOBENGAR_15_00"); //Where can I find the high pastures and Bengar's farm?
	AI_Output			(self, other, "DIA_Balthasar_WOBENGAR_05_01"); //Follow this path and cross the big crossroad.
	AI_Output			(self, other, "DIA_Balthasar_WOBENGAR_05_02"); //If you stick to the right, you'll see a big outcropping of rock. Behind that to the right are the high pastures and the pass.
};


///////////////////////////////////////////////////////////////////////
//	Info talktoBengar
///////////////////////////////////////////////////////////////////////
instance DIA_Balthasar_TALKTOBENGAR		(C_INFO)
{
	npc		 = 	BAU_932_Balthasar;
	nr		 = 	6;
	condition	 = 	DIA_Balthasar_TALKTOBENGAR_Condition;
	information	 = 	DIA_Balthasar_TALKTOBENGAR_Info;

	description	 = 	"Maybe I should talk to Bengar.";
};

func int DIA_Balthasar_TALKTOBENGAR_Condition ()
{
	if (
		(Npc_KnowsInfo(other, DIA_Balthasar_AERGERMITNACHBARN))
		&& ((hero.guild == GIL_NONE)||(hero.guild == GIL_SLD)||(hero.guild == GIL_DJG))
		&& 	(
			((Npc_IsDead(BalthasarSheep1))== FALSE)
			|| ((Npc_IsDead(BalthasarSheep2))== FALSE)
			|| ((Npc_IsDead(BalthasarSheep3))== FALSE)
			)
		)
			{
					return TRUE;
			};
};

func void DIA_Balthasar_TALKTOBENGAR_Info ()
{
	AI_Output			(other, self, "DIA_Balthasar_TALKTOBENGAR_15_00"); //Maybe I should talk to Bengar.
	AI_Output			(self, other, "DIA_Balthasar_TALKTOBENGAR_05_01"); //You'd do that for me? What will you tell him, I mean, I don't want any trouble, you hear?
	AI_Output			(other, self, "DIA_Balthasar_TALKTOBENGAR_15_02"); //We'll see about that.

	Log_CreateTopic (TOPIC_BalthasarsSchafe, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BalthasarsSchafe, LOG_RUNNING);
	B_LogEntry (TOPIC_BalthasarsSchafe,"Farmer Bengar has forbidden Balthasar the shepherd to take his sheep to the high pastures."); 
	MIS_Balthasar_BengarsWeide = LOG_RUNNING;
};

///////////////////////////////////////////////////////////////////////
//	Info Bengarueberredet
///////////////////////////////////////////////////////////////////////
instance DIA_Balthasar_BENGARUEBERREDET		(C_INFO)
{
	npc		 = 	BAU_932_Balthasar;
	nr		 = 	8;
	condition	 = 	DIA_Balthasar_BENGARUEBERREDET_Condition;
	information	 = 	DIA_Balthasar_BENGARUEBERREDET_Info;

	description	 = 	"You can bring your sheep back to Bengar's pastures.";
};

func int DIA_Balthasar_BENGARUEBERREDET_Condition ()
{
	if 	(
		(Npc_KnowsInfo(other, DIA_Balthasar_TALKTOBENGAR))
		&& (MIS_Balthasar_BengarsWeide == LOG_SUCCESS)
		&& ((hero.guild == GIL_NONE)||(hero.guild == GIL_SLD)||(hero.guild == GIL_DJG))
		&& 	(
			((Npc_IsDead(BalthasarSheep1))== FALSE)
			|| ((Npc_IsDead(BalthasarSheep2))== FALSE)
			|| ((Npc_IsDead(BalthasarSheep3))== FALSE)
			)
		)
			{
					return TRUE;
			};
};

func void DIA_Balthasar_BENGARUEBERREDET_Info ()
{
	AI_Output			(other, self, "DIA_Balthasar_BENGARUEBERREDET_15_00"); //You can bring your sheep back to Bengar's pastures. I've talked to him.
	AI_Output			(self, other, "DIA_Balthasar_BENGARUEBERREDET_05_01"); //Thank you. I'll be right on my way.
	AI_Output			(self, other, "DIA_Balthasar_BENGARUEBERREDET_05_02"); //Here, take these sheepskins as a token of my appreciation.

	B_GiveInvItems (self, other, ItAt_SheepFur, 10);  

	AI_StopProcessInfos (self);

	Npc_ExchangeRoutine	(self,"BengarsWeide"); 	

	B_GivePlayerXP (XP_Balthasar_BengarsWeide);

	//Joly: "NW_BIGMILL_FARM3_BALTHASAR"
	
	Wld_InsertNpc	(Sheep,"NW_BIGMILL_FARM3_BALTHASAR"); 
	Wld_InsertNpc	(Sheep,"NW_BIGMILL_FARM3_BALTHASAR"); 
	Wld_InsertNpc	(Hammel,"NW_BIGMILL_FARM3_BALTHASAR"); 

	BalthasarSheep1 = Hlp_GetNpc (Balthasar_Sheep1); 

	if (Hlp_IsValidNpc(BalthasarSheep1))
	&& (!Npc_IsDead(BalthasarSheep1))
		{
			AI_StartState (BalthasarSheep1, ZS_MM_Rtn_Follow_Sheep_Balthasar, 1, "");
		};
	BalthasarSheep2 = Hlp_GetNpc (Balthasar_Sheep2); 

	if (Hlp_IsValidNpc(BalthasarSheep2))
	&& (!Npc_IsDead(BalthasarSheep2))
		{
			AI_StartState (BalthasarSheep2, ZS_MM_Rtn_Follow_Sheep_Balthasar, 1, "");
		};	
	BalthasarSheep3 = Hlp_GetNpc (Balthasar_Sheep3); 

	if (Hlp_IsValidNpc(BalthasarSheep3))
	&& (!Npc_IsDead(BalthasarSheep3))
		{
			AI_StartState (BalthasarSheep3, ZS_MM_Rtn_Follow_Sheep_Balthasar, 1, "");
		};
};

///////////////////////////////////////////////////////////////////////
//	Info permKap1
///////////////////////////////////////////////////////////////////////
instance DIA_Balthasar_PERMKAP1		(C_INFO)
{
	npc		 = 	BAU_932_Balthasar;
	nr		 = 	70;
	condition	 = 	DIA_Balthasar_PERMKAP1_Condition;
	information	 = 	DIA_Balthasar_PERMKAP1_Info;
	permanent	 = 	TRUE;

	description	 = 	"Everything else all right?";
};

func int DIA_Balthasar_PERMKAP1_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Balthasar_WASMACHSTDU)) 
		{
				return TRUE;
		};
};

func void DIA_Balthasar_PERMKAP1_Info ()
{
	AI_Output			(other, self, "DIA_Balthasar_PERMKAP1_15_00"); //Everything else all right?
	
	Npc_PerceiveAll(self);
	if 	(
				(
					( Wld_DetectNpc(self,Balthasar_Sheep1,NOFUNC,-1) && (Npc_GetDistToNpc(self, other)<2000) )
					||( Wld_DetectNpc(self,Balthasar_Sheep2,NOFUNC,-1) && (Npc_GetDistToNpc(self, other)<2000) )
					||( Wld_DetectNpc(self,Balthasar_Sheep3,NOFUNC,-1) && (Npc_GetDistToNpc(self, other)<2000) )
					||( Wld_DetectNpc(self,Sheep,NOFUNC,-1) && (Npc_GetDistToNpc(self, other)<2000) )
					||( Wld_DetectNpc(self,Hammel,NOFUNC,-1) && (Npc_GetDistToNpc(self, other)<2000) )
				)
		)
			
				{
					AI_Output			(self, hero, "DIA_Balthasar_PERMKAP1_05_01"); //I can't complain. Thanks for asking.
					AI_StopProcessInfos (self);
				}
	else
			{
				AI_Output			(self, hero, "DIA_Balthasar_PERMKAP1_05_02"); //These are bad times. I can't find my sheep!
				if (Npc_IsDead(Sekob)== FALSE)
				{
					AI_Output			(self, hero, "DIA_Balthasar_PERMKAP1_05_03"); //I guess I'll have to fess up to Sekob.
				};
				AI_StopProcessInfos (self);
				Npc_ExchangeRoutine	(self,"Start"); //Joly: falls er auf der 2. Weide bei Bengar ist.
			};
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Balthasar_PICKPOCKET (C_INFO)
{
	npc			= BAU_932_Balthasar;
	nr			= 900;
	condition	= DIA_Balthasar_PICKPOCKET_Condition;
	information	= DIA_Balthasar_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Balthasar_PICKPOCKET_Condition()
{
	C_Beklauen (10, 10);
};
 
FUNC VOID DIA_Balthasar_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Balthasar_PICKPOCKET);
	Info_AddChoice		(DIA_Balthasar_PICKPOCKET, DIALOG_BACK 		,DIA_Balthasar_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Balthasar_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Balthasar_PICKPOCKET_DoIt);
};

func void DIA_Balthasar_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Balthasar_PICKPOCKET);
};
	
func void DIA_Balthasar_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Balthasar_PICKPOCKET);
};
















