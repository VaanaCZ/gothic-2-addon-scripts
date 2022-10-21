// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_Dragon_Rock_Exit(C_INFO)
{
	
	nr			= 999;
	condition	= DIA_Dragon_Rock_Exit_Condition;
	information	= DIA_Dragon_Rock_Exit_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Dragon_Rock_Exit_Condition()
{
	if (DragonTalk_Exit_Free == TRUE)
		{
				return TRUE;
		};
};

FUNC VOID DIA_Dragon_Rock_Exit_Info()
{	
	Npc_RemoveInvItems (other,ItMi_InnosEye_MIS,1);
	CreateInvItems 	   (other,ItMi_InnosEye_Discharged_MIS,1);	 

	AI_Output			(self, other, "DIA_Dragon_Rock_Exit_20_00"); //Enough words. Your temporary power is exhausted. The Eye has lost its strength. Prepare to die.

	AI_StopProcessInfos	(self);
	DragonTalk_Exit_Free  = FALSE;
	self.flags =  0;
};

// *************************************************************************
// 									Hello
// *************************************************************************
INSTANCE DIA_Dragon_Rock_Hello(C_INFO)
{
	
	nr			= 1;
	condition	= DIA_Dragon_Rock_Hello_Condition;
	information	= DIA_Dragon_Rock_Hello_Info;
	permanent	= FALSE;
	important 	= TRUE;
};                       

FUNC INT DIA_Dragon_Rock_Hello_Condition()
{
	if (Npc_HasItems (other,ItMi_InnosEye_MIS) >= 1)
	{
		return 1;
	};	
};

FUNC VOID DIA_Dragon_Rock_Hello_Info()
{	
	AI_Output			(self, other, "DIA_Dragon_Rock_Hello_20_00"); //Yet another presumptuous wight who dares to climb my rock. You little humans. So brave, and yet so fragile.
	if (Mis_KilledDragons == 0)
	{
		AI_Output			(other, self, "DIA_Dragon_Rock_Hello_15_01"); //Hey, you can actually talk.
	};
	AI_Output (self, other, "DIA_Dragon_Rock_Hello_20_02"); //I shall tear out your entrails and feed them to the rats.
	AI_Output (other, self, "DIA_Dragon_Rock_Add_15_00"); //Not so fast. I bear the Eye of Innos. You will obey me and answer my questions.
	AI_Output (self, other, "DIA_Dragon_Rock_Hello_20_04"); //(bellows) Arrh. Ask your questions.

};


///////////////////////////////////////////////////////////////////////
//	Info WerBistDu
///////////////////////////////////////////////////////////////////////
instance DIA_Dragon_Rock_WERBISTDU		(C_INFO)
{
	nr		 = 	6;
	condition	 = 	DIA_Dragon_Rock_WERBISTDU_Condition;
	information	 = 	DIA_Dragon_Rock_WERBISTDU_Info;

	description	 = 	"Who are you?";
};

func int DIA_Dragon_Rock_WERBISTDU_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Dragon_Rock_Hello))
		{
				return TRUE;
		};
};

func void DIA_Dragon_Rock_WERBISTDU_Info ()
{
	AI_Output			(other, self, "DIA_Dragon_Rock_WERBISTDU_15_00"); //Who are you?
	AI_Output			(self, other, "DIA_Dragon_Rock_WERBISTDU_20_01"); //I am called Pedrakhan and I shall slowly skin you alive when I catch you.

};


///////////////////////////////////////////////////////////////////////
//	Info Hierarchie
///////////////////////////////////////////////////////////////////////
instance DIA_Dragon_Rock_HIERARCHIE		(C_INFO)
{
	nr		 = 	7;
	condition	 = 	DIA_Dragon_Rock_HIERARCHIE_Condition;
	information	 = 	DIA_Dragon_Rock_HIERARCHIE_Info;

	description	 = 	"Who is the strongest among you dragons?";
};

func int DIA_Dragon_Rock_HIERARCHIE_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Dragon_Rock_Hello))
		{
				return TRUE;
		};
};

func void DIA_Dragon_Rock_HIERARCHIE_Info ()
{
	AI_Output			(other, self, "DIA_Dragon_Rock_HIERARCHIE_15_00"); //Who is the strongest among you dragons?
	AI_Output			(self, other, "DIA_Dragon_Rock_HIERARCHIE_20_01"); //We draw our power from the elements of this world. Their hierarchy is clear and simple.
	AI_Output			(self, other, "DIA_Dragon_Rock_HIERARCHIE_20_02"); //Land formed of soft earth bestows life on all creatures under the sun. Yet it will open up and swallow you entirely if you get too close to it.
	AI_Output			(self, other, "DIA_Dragon_Rock_HIERARCHIE_20_03"); //The rock, which would rather break than ever surrender, towers with pride and buries the careless beneath itself. And yet it offers the best protection from the tide.
	AI_Output			(self, other, "DIA_Dragon_Rock_HIERARCHIE_20_04"); //The spark of life lives in the deep fires of this world. And yet the fire incinerates everything in a breath, leaving nothing but ashes.
	AI_Output			(self, other, "DIA_Dragon_Rock_HIERARCHIE_20_05"); //All our elements preserve and destroy. But only in water that has become hard and solid as rock will everything be transformed into an eternal pillar of salt where life is barely possible.

};


//**********************************************************************************
//		B_AssignDragonTalk_Rock
//**********************************************************************************

FUNC VOID B_AssignDragonTalk_Rock (var c_NPC slf)
{
	DIA_Dragon_Rock_EXIT.npc				= Hlp_GetInstanceID(slf);
	DIA_Dragon_Rock_Hello.npc				= Hlp_GetInstanceID(slf);
	DIA_Dragon_Rock_WERBISTDU.npc				= Hlp_GetInstanceID(slf);
	DIA_Dragon_Rock_HIERARCHIE.npc				= Hlp_GetInstanceID(slf);
	
	//Die Drachenfragen
	B_AssignDragonTalk_Main (slf);
		
};






