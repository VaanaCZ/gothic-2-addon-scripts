////////////////////////////////////////////////////////////////////////////////
//
//	ItSc_SummonMud
//

const int 	Value_Sc_SummonMud			=  	300;	// FIXME_Noki: Tuning (zu teuer?)

instance ItSc_SummonMud(C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_SummonMud;

	visual				=	"ItSc_SumDemon.3DS";	// FIXME_Noki: Eigenes Visual
	material			=	MAT_LEATHER;

	spell				= 	SPL_SummonMud;
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	SPL_Cost_Scroll;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	NAME_SPL_SummonMud;
	
	TEXT	[0]			=	Name_MageScroll;
	
	TEXT	[1]			=	NAME_Mana_Needed;			
	COUNT	[1]			=	SPL_Cost_Scroll;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};

////////////////////////////////////////////////////////////////////////////////
//
//	Aya_Testmodell
//

instance Aya_Testmodell (Npc_Default)
{
	name							= "Aya";
	guild							= GIL_NONE;
	id								= 55555;
	voice							= 16;
	flags							= NPC_FLAG_IMMORTAL;
	npctype							= NPCTYPE_FRIEND;
	fight_tactic					= FAI_HUMAN_MASTER;
	daily_routine					= Rtn_Start_55555;
	bodyStateInterruptableOverride	= TRUE;

	aivar[AIV_RANSACKED]			= TRUE;
	aivar[AIV_DeathInvGiven]		= TRUE;
//	aivar[AIV_PARTYMEMBER]			= TRUE;
	aivar[AIV_VictoryXPGiven]		= TRUE;
	aivar[AIV_IGNORE_Murder]		= TRUE;
	aivar[AIV_IGNORE_Theft]			= TRUE;
	aivar[AIV_IGNORE_Sheepkiller]	= TRUE;
	aivar[AIV_ToughGuy]				= TRUE;
	aivar[AIV_ToughGuyNewsOverride]	= TRUE;
	aivar[AIV_IgnoresArmor]			= TRUE;
	aivar[AIV_IgnoresFakeGuild]		= TRUE;

	B_SetAttributesToChapter		(self, 6);
	B_SetFightSkills				(self, 100);
	B_GiveNpcTalents				(self);

	EquipItem						(self, ItMw_BeliarWeapon_Fire);
	CreateInvItems					(self, ItAr_BauBabe_L, 1);
	CreateInvItems					(self, ItAr_BauBabe_M, 1);
	CreateInvItems					(self, ItAr_VlkBabe_L, 1);
	CreateInvItems					(self, ItAr_VlkBabe_M, 1);
//	CreateInvItems					(self, ItAr_VlkBabe_H, 1);

	B_SetNpcVisual 					(self, FEMALE, "Hum_Head_Babe", FaceBabe_N_BlackHair, BodyTexBabe_S, ItAr_VlkBabe_H);
	Mdl_ApplyOverlayMds				(self, "Humans_Babe.mds");
//	Mdl_SetModelScale				(self, 0.9, 0.9, 1.1);
//	Mdl_SetModelFatness				(self, 0);
};

func void Rtn_Start_55555()
{
	TA_Stand_ArmsCrossed(06,00, 23,00, "XXX");
	TA_Stand_ArmsCrossed(23,00, 06,00, "XXX");
};

func void Rtn_Follow_55555()
{
	TA_Follow_Player(08,00, 23,00, "XXX");
    TA_Follow_Player(23,00, 08,00, "XXX");
};

instance DIA_Aya_KommMit(C_Info)
{
	npc			= Aya_Testmodell;
	nr			= 1;
	condition	= DIA_Aya_KommMit_Condition;
	information	= DIA_Aya_KommMit_Info;
	permanent	= TRUE;
	description	= "Okay, lass uns gehen.";
};                       
func int DIA_Aya_KommMit_Condition()
{
	if (self.aivar[AIV_PARTYMEMBER] == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Aya_KommMit_Info()
{
	AI_Output(other, self, "DIA_Lares_GoNow_15_00");  //Okay, lass uns gehen.

	var int AyaGoldAmount;
	AyaGoldAmount = Npc_HasItems(other, ItMi_Gold);
	if (AyaGoldAmount > 1000)
	{
		AyaGoldAmount = 1000;
	};
	if (AyaGoldAmount > 0)
	{
		B_Say(self, other, "$WHERETO");
		B_GiveInvItems(other, self, ItMi_Gold, AyaGoldAmount);
		Npc_RemoveInvItems(self, ItMi_Gold, AyaGoldAmount);  // :p
	}
	else
	{
		B_Say(self, other, "$SHITNOGOLD");
	};
	AI_StopProcessInfos(self);
	if (AyaGoldAmount > 0)
	{
		Npc_ExchangeRoutine(self, "Follow");
		self.aivar[AIV_PARTYMEMBER] = TRUE;
	};
};

instance DIA_Aya_WarteHier(C_Info)
{
	npc			= Aya_Testmodell;
	nr			= 1;
	condition	= DIA_Aya_WarteHier_Condition;
	information	= DIA_Aya_WarteHier_Info;
	permanent	= TRUE;
	description	= "Ich fürchte, ich muss mich von dir trennen.";
};
func int DIA_Aya_WarteHier_Condition()
{
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Aya_WarteHier_Info()
{
	AI_Output(other, self, "DIA_Biff_GELDEINTREIBEN_zuTeuer_trennen_15_00");  //Ich fürchte, ich muss mich von dir trennen.
	B_Say(self, other, "$YESGOOUTOFHERE");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self, "Start");
	self.aivar[AIV_PARTYMEMBER] = FALSE;
};

instance DIA_Aya_EXIT(C_Info)
{
	npc         = Aya_Testmodell;
	nr          = 999;
	condition   = DIA_Aya_EXIT_Condition;
	information = DIA_Aya_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
func int DIA_Aya_EXIT_Condition()
{
	return TRUE;
};
func void DIA_Aya_EXIT_Info()
{
	AI_StopProcessInfos(self);
};
