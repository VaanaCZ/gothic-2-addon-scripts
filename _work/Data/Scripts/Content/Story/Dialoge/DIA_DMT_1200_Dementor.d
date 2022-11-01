// ************************************************************
// 	  				   EXIT KAP3
// ************************************************************

INSTANCE DIA_BridgeDementor_EXIT(C_INFO)
{
	npc			= DMT_1200_Dementor;
	nr			= 999;
	condition	= DIA_BridgeDementor_EXIT_Condition;
	information	= DIA_BridgeDementor_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_BridgeDementor_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_BridgeDementor_EXIT_Info()
{	
	Wld_StopEffect("DEMENTOR_FX");
	B_SCIsObsessed (self);
	AI_StopProcessInfos (self);
	Npc_SetRefuseTalk (self,30);	
	B_Attack(self,other,AR_NONE,1);	
	Snd_Play 	("MFX_FEAR_CAST" );

};	
///////////////////////////////////////////////////////////////////////
//	Info BridgeDementor (steht an der Brücke)
///////////////////////////////////////////////////////////////////////
instance DIA_BridgeDementor		(C_INFO)
{
	npc		 	= 	DMT_1200_Dementor;
	nr		 	= 	1;
	condition	= 	DIA_BridgeDementor_Condition;
	information	= 	DIA_BridgeDementor_Info;
	permanent	=	TRUE;
	important   =	TRUE;
	
};

func int DIA_BridgeDementor_Condition ()
{
	if (Npc_RefuseTalk(self) == FALSE)
	{
		return TRUE;
	};	
};

func void DIA_BridgeDementor_Info ()
{
	Wld_PlayEffect("DEMENTOR_FX",  hero, hero, 0, 0, 0, FALSE );
	Wld_PlayEffect("spellFX_Fear",  self, self, 0, 0, 0, FALSE );
	AI_PlayAni (self,"T_PRACTICEMAGIC5");	
	
	AI_Output			(self ,other, "DIA_BridgeDementor_19_00"); //Vędęli jsme, že pâijdeš!
	AI_Output			(self ,other, "DIA_BridgeDementor_19_01"); //Můj Pán dosáhne vítęzství a pâevezme vládu nad celým svętem.
	AI_Output			(self ,other, "DIA_BridgeDementor_19_02"); //Ty popletenej hlupáku! Nemáš ani tušení, komu ses postavil, a já tę zničím právę teë a právę tady!

	Npc_SetRefuseTalk (self,30);	
};
