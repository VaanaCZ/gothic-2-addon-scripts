///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Engardo_EXIT   (C_INFO)
{
	npc         = SLD_841_Engardo;
	nr          = 999;
	condition   = DIA_Engardo_EXIT_Condition;
	information = DIA_Engardo_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Engardo_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Engardo_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

 
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Engardo_HALLO		(C_INFO)
{
	npc			 = 	SLD_841_Engardo;
	nr			 = 	4;
	condition	 = 	DIA_Engardo_HALLO_Condition;
	information	 = 	DIA_Engardo_HALLO_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};

func int DIA_Engardo_HALLO_Condition ()
{
	if (Npc_IsInState (self,ZS_Talk))
	{
		return TRUE;
	};	
};
//-----------------------------------
var int Chance;
//-----------------------------------
func void DIA_Engardo_HALLO_Info ()
{
	Akils_SLDStillthere = TRUE;
	if (Chance == FALSE)
	{
		AI_Output (self, other, "DIA_Engardo_HALLO_13_00"); //Hej, burane, ztratil ses? Vra� se zp�tky na pole a vyt�hni tam n�jak� tu��ny.
		Chance = 1;
		AI_StopProcessInfos (self);
	}
	else if (Chance == 1) 
	{	
		AI_Output (self, other, "DIA_Engardo_HALLO_13_01"); //Jsi ve �patn� �as na �patnym m�st�...
		AI_Output (self, other, "DIA_Engardo_HALLO_13_02"); //...tak�e m�m dojem, �e jestli se chce� do��t r�na, m�l bys te� hned odsud p�kn� vysmahnout, jasn�?
		Chance = 2;
		AI_StopProcessInfos (self);
	}
	else if (Chance == 2)
	{
		AI_Output (self, other, "DIA_Engardo_HALLO_13_03"); //M� snad n�co s u�ima? Nebo se chce� pozdravit se zubatou? (cynicky) Fajn, te� u� je pozd�.
		
		AI_StopProcessInfos (self);
		B_Attack (self, other, AR_SuddenEnemyInferno, 1);
		
	};
};




// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Engardo_PICKPOCKET (C_INFO)
{
	npc			= SLD_841_Engardo;
	nr			= 900;
	condition	= DIA_Engardo_PICKPOCKET_Condition;
	information	= DIA_Engardo_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Engardo_PICKPOCKET_Condition()
{
	C_Beklauen (34, 45);
};
 
FUNC VOID DIA_Engardo_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Engardo_PICKPOCKET);
	Info_AddChoice		(DIA_Engardo_PICKPOCKET, DIALOG_BACK 		,DIA_Engardo_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Engardo_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Engardo_PICKPOCKET_DoIt);
};

func void DIA_Engardo_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Engardo_PICKPOCKET);
};
	
func void DIA_Engardo_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Engardo_PICKPOCKET);
};






