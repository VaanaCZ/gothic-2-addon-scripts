// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Addon_Ramon_EXIT (C_INFO)
{
	npc			= BDT_1071_Addon_Ramon;
	nr			= 999;
	condition	= DIA_Addon_Ramon_EXIT_Condition;
	information	= DIA_Addon_Ramon_EXIT_Info;
	permanent	= TRUE;
	description	= DIALOG_ENDE;
};        
         
FUNC INT DIA_Addon_Ramon_EXIT_Condition()
{	
	return TRUE;
};

FUNC VOID DIA_Addon_Ramon_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 				  	Guard_Passage - First Warn
// ************************************************************

// -----------------------------------------------------------
	const string BDT_1071_Checkpoint	= "BL_UP_CHECK";	
// -----------------------------------------------------------
	
instance DIA_Addon_Ramon_FirstWarn (C_INFO)
{
	npc			= BDT_1071_Addon_Ramon;
	nr			= 1;
	condition	= DIA_Addon_Ramon_FirstWarn_Condition;
	information	= DIA_Addon_Ramon_FirstWarn_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

func int DIA_Addon_Ramon_FirstWarn_Condition()
{
	if (Npc_GetDistToWP(other, BDT_1071_Checkpoint) <= 700) //NICHT von hinten!
	{
		Npc_SetRefuseTalk(self,5);
		return FALSE;
	};
	
	if ((self.aivar[AIV_Guardpassage_Status]			== GP_NONE		)
	&&  (self.aivar[AIV_PASSGATE]						== FALSE		)
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)		== TRUE			)
	&&  (Npc_RefuseTalk(self) 							== FALSE 		))
	{
		return TRUE;
	};
};
func void DIA_Addon_Ramon_FirstWarn_Info()
{
	if Npc_IsDead (Franco)
	{
		AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_07_00"); //Tak co se tam stalo?
		AI_Output (other, self,"DIA_Addon_Ramon_FirstWarn_15_01"); //Uzemnil jsem Franca.
		AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_07_02"); //Takže teë je na TOBÊ, aby ti líní psi poâádnê makali?
		AI_Output (other, self,"DIA_Addon_Ramon_FirstWarn_15_03"); //Hele, nenechám se otravovat od nêjakejch lovcù. Chci se dostat do tábora.
		AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_07_04"); //Tak na to zapomeà. Sejmul jsi Franca, takže teë to tu vedeš ty. Šupito presto, do práce.
		AI_Output (other, self,"DIA_Addon_Ramon_FirstWarn_15_05"); //Jestli to tu vedu, pak rozhoduju, kdo je právê na âadê.
		AI_Output (other, self,"DIA_Addon_Ramon_FirstWarn_15_06"); //A rozhodl jsem se, že další pùjdu JÁ!
		AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_07_07"); //(smêje se) To není tak lehký. O NIKOHO jsme nežádali, takže dovnitâ nepùjde NIKDO.
		AI_Output (other, self,"DIA_Addon_Ramon_FirstWarn_15_08"); //Thorus mùže lovcùm poslat novýho velitele a pak si mùžu vevnitâ trochu oddáchnout.
		AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_07_09"); //(smêje se) Ty se jen tak nevzdáš, co? No dobâe, pohni zadkem, aã už jsi uvnitâ.
		AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_07_10"); //Thorus se postará, aby lovci nezùstali dlouho bez velitele.
		AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_07_11"); //Na co èekáš? A koukej si vzít krumpáè!
		
		self.aivar[AIV_PASSGATE] = TRUE;
		Player_HasTalkedToBanditCamp = TRUE;
		B_GivePlayerXP (XP_Addon_Hinein);
		AI_StopProcessInfos(self);
		
		
		AI_Teleport (Carlos,"BL_WAIT_FINN");//40 m Glumpsche
		
		B_StartOtherRoutine (Carlos,"START");
		B_StartOtherRoutine (Finn, "START");
	}
	else if (Ramon_News == FALSE)
	{
		AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_07_12"); //Hele, co chceš? Nedokážu si pâedstavit, že by tê jen tak mirnyx-týrnyx pustili pro tábora.
		
		if Npc_KnowsInfo (other, DIA_Addon_Franco_HI)
		{
			AI_Output (other, self,"DIA_Addon_Ramon_FirstWarn_15_13"); //Posílá mê Franco. Chce vêdêt, jestli nêkoho v táboâe nepotâebujete.
		};
		AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_07_14"); //Jo, nêkoho potâebujem. Vèera natáhnul brka další chlápek
		AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_07_15"); //Ten debil si zahrával s Estebanem.
		AI_Output (other, self,"DIA_Addon_Ramon_FirstWarn_15_16"); //Kdo je Esteban?
		AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_07_17"); //Velitel dolního tábora. Rozhoduje, kdo pùjde do dolu.
		AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_07_18"); //Tak vyâië Francovi, že Thorus chce novýho chlapa, jasný?
		
		Log_CreateTopic (Topic_Addon_Franco,LOG_MISSION);
		Log_SetTopicStatus (Topic_Addon_Franco,LOG_RUNNING);
		B_LogEntry (Topic_Addon_Franco,"Thorus potâebuje v táboâe nêkoho nového. To bude Franca zajímat.");
		
		Info_ClearChoices (DIA_Addon_Ramon_FirstWarn);
		Info_AddChoice    (DIA_Addon_Ramon_FirstWarn,"Thorus? TEN Thorus?",DIA_Addon_Ramon_FirstWarn_YES);
		Info_AddChoice    (DIA_Addon_Ramon_FirstWarn,"Thorus? Nikdy jsem o nêm neslyšel...",DIA_Addon_Ramon_FirstWarn_NO);
		
		Ramon_News = TRUE;
	}
	else
	{
		AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_07_19"); //Hele, zpomal! Tady není nic k vidêní. Koukej vypadnout!
		AI_StopProcessInfos(self);
	};
				
	other.aivar[AIV_LastDistToWP] 		= Npc_GetDistToWP(other,BDT_1071_Checkpoint);
	self.aivar[AIV_Guardpassage_Status]	= GP_FirstWarnGiven;
};
FUNC VOID DIA_Addon_Ramon_FirstWarn_YES()
{
	AI_Output (other, self,"DIA_Addon_Ramon_FirstWarn_YES_15_00"); //Thorus? TEN Thorus.
	AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_YES_07_01"); //Jo, TEN Thorus. TEN chlap, kterej chtêl nový lidi.
	AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_YES_07_02"); //Ten chlap, kterej rozhoduje, kdy a jestli vùbec se nêkdo novej dostane z bažiny a do tábora.
	AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_YES_07_03"); //Nechceš mi snad namluvit, že ho znáš nêkdy z dâívêjška.
	AI_Output (other, self,"DIA_Addon_Ramon_FirstWarn_YES_15_04"); //No... ano.
	AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_YES_07_05"); //Poslyš – Thoruse zná KAŽDÝ.
	AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_YES_07_06"); //Ale stejnê dovnitâ nepùjdeš – a já mu nic vzkazovat NEBUDU!
	
	Info_ClearChoices (DIA_Addon_Ramon_FirstWarn);
};
FUNC VOID DIA_Addon_Ramon_FirstWarn_NO()
{
	AI_Output (other, self,"DIA_Addon_Ramon_FirstWarn_NO_15_00"); //Thorus? O tom jsem nikdy neslyšel.
	AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_NO_07_01"); //Èoveèe, ty ho neznáš? Dyk to bejval šéf stráží ve Starým táboâe.
	AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_NO_07_02"); //Je to chlap, kterýmu tu každej vêâí.
	AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_NO_07_03"); //Žádá o nový lidi a rozhoduje, kdy a jestli vùbec se nêkdo z novê pâíchozích dostane do tábora.
	AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_NO_07_04"); //Jestli ještê nêjakou dobu pâežiješ, urèitê ho poznáš.
	
	Info_ClearChoices (DIA_Addon_Ramon_FirstWarn);
};
// ************************************************************
// 				  	Guard_Passage - Second Warn
// ************************************************************

INSTANCE DIA_Addon_Ramon_SecondWarn (C_INFO)
{
	npc			= BDT_1071_Addon_Ramon;
	nr			= 2;
	condition	= DIA_Addon_Ramon_SecondWarn_Condition;
	information	= DIA_Addon_Ramon_SecondWarn_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

FUNC INT DIA_Addon_Ramon_SecondWarn_Condition()
{
	if ((self.aivar[AIV_Guardpassage_Status]			== GP_FirstWarnGiven					)
	&&  (self.aivar[AIV_PASSGATE]						== FALSE								) 
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)		== TRUE									)
	&&  (Npc_GetDistToWP(other,BDT_1071_Checkpoint)		<  (other.aivar[AIV_LastDistToWP]-50)	)) 
	{
		return TRUE;
	};
};

func void DIA_Addon_Ramon_SecondWarn_Info()
{
	AI_Output (self, other,"DIA_Addon_Ramon_SecondWarn_07_00"); //Ještê krok a bude to tvùj poslední!

	other.aivar[AIV_LastDistToWP] 		= Npc_GetDistToWP (other,BDT_1071_Checkpoint);
	self.aivar[AIV_Guardpassage_Status]	= GP_SecondWarnGiven;	
	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 				  	Guard_Passage - Attack
// ************************************************************

INSTANCE DIA_Addon_Ramon_Attack (C_INFO)
{
	npc			= BDT_1071_Addon_Ramon;
	nr			= 3;
	condition	= DIA_Addon_Ramon_Attack_Condition;
	information	= DIA_Addon_Ramon_Attack_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

FUNC INT DIA_Addon_Ramon_Attack_Condition()
{
	if ((self.aivar[AIV_Guardpassage_Status]			== GP_SecondWarnGiven					)
	&&  (self.aivar[AIV_PASSGATE]						== FALSE								) 
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)		== TRUE									)
	&&  (Npc_GetDistToWP(other,BDT_1071_Checkpoint)		<  (other.aivar[AIV_LastDistToWP]-50)	))
	{
		return TRUE;
	};
};

func void DIA_Addon_Ramon_Attack_Info()
{
	other.aivar[AIV_LastDistToWP] 			= 0;
	self.aivar[AIV_Guardpassage_Status]	= GP_NONE;						//wird auch in ZS_Attack resettet
	
	AI_Output (self, other,"DIA_Addon_Ramon_Attack_07_00"); //Nêkterý lidi se nikdy nepouèí.
	
	AI_StopProcessInfos	(self);
	B_Attack (self, other, AR_GuardStopsIntruder, 0); 
};
// ************************************************************
// 			News
// ************************************************************
INSTANCE DIA_Addon_Ramon_News (C_INFO)
{
	npc			= BDT_1071_Addon_Ramon;
	nr			= 10;
	condition	= DIA_Addon_Ramon_News_Condition;
	information	= DIA_Addon_Ramon_News_Info;
	permanent	= FALSE;
	description	= "Já jsem ten nový.";
};                       

FUNC INT DIA_Addon_Ramon_News_Condition()
{	
	if !Npc_IsDead (Franco)
	{
		return TRUE;
	};
};
func void DIA_Addon_Ramon_News_Info()
{
	AI_Output (other, self,"DIA_Addon_Ramon_News_15_00"); //Já jsem ten novej.
	AI_Output (self, other,"DIA_Addon_Ramon_News_07_01"); //Hele, nesnaž se mê napálit. O tom, kdo z vás se dostane do tábora, furt ještê rozhoduje Franco.
};
// ************************************************************
// 			Lie
// ************************************************************
INSTANCE DIA_Addon_Ramon_Lie (C_INFO)
{
	npc			= BDT_1071_Addon_Ramon;
	nr			= 10;
	condition	= DIA_Addon_Ramon_Lie_Condition;
	information	= DIA_Addon_Ramon_Lie_Info;
	permanent	= FALSE;
	description	= "Posílá mê Franco...";
};                       

FUNC INT DIA_Addon_Ramon_Lie_Condition()
{
	if Npc_KnowsInfo (other,DIA_Addon_Ramon_News)
	&& !Npc_IsDead (Franco)
	{
		return TRUE;
	};
};
func void DIA_Addon_Ramon_Lie_Info()
{
	AI_Output (other, self,"DIA_Addon_Ramon_Lie_15_00"); //Posílá mê Franco.
	AI_Output (self, other,"DIA_Addon_Ramon_Lie_07_01"); //Tak to teda ne. Koukej zmizet, než ti zpâelámu hnáty.
	
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			Perm
// ************************************************************
INSTANCE DIA_Addon_Ramon_Perm (C_INFO)
{
	npc			= BDT_1071_Addon_Ramon;
	nr			= 99;
	condition	= DIA_Addon_Ramon_Perm_Condition;
	information	= DIA_Addon_Ramon_Perm_Info;
	permanent	= TRUE;
	description	= "Je všecko pod kontrolou?";
};                       

FUNC INT DIA_Addon_Ramon_Perm_Condition()
{
	if Npc_KnowsInfo (other,DIA_Addon_Ramon_News)
	&& !Npc_IsDead (Franco)
	{
		return TRUE;
	};
};
func void DIA_Addon_Ramon_Perm_Info()
{
	AI_Output (other, self,"DIA_Addon_Ramon_Perm_15_00"); //Je všecko pod kontrolou?
	AI_Output (self, other,"DIA_Addon_Ramon_Perm_07_01"); //Všecko je v pohodê, pokud se sem nepokouší vloudit nêkdo, kdo tu NEMÁ CO DÊLAT
	
	AI_StopProcessInfos (self);
};


