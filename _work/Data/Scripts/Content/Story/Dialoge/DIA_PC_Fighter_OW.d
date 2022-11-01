
// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_GornOW_EXIT(C_INFO)
{
	npc			= PC_Fighter_OW;
	nr			= 999;
	condition	= DIA_GornOW_EXIT_Condition;
	information	= DIA_GornOW_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_GornOW_EXIT_Condition()
{
	return TRUE;
};
 
FUNC VOID DIA_GornOW_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 			  Hallo
// ************************************************************
INSTANCE DIA_GornOW_Hello (C_INFO)
{
	npc			= PC_Fighter_OW;
	nr			= 2;
	condition	= DIA_GornOW_Hello_Condition;
	information	= DIA_GornOW_Hello_Info;
	permanent	= FALSE;
	IMPORTANT 	= TRUE;
};                       

FUNC INT DIA_GornOW_Hello_Condition()
{
		return TRUE;
};
 
FUNC VOID DIA_GornOW_Hello_Info()
{	

	VAR C_NPC Milten;
	Milten			= Hlp_GetNpc(PC_Mage_OW);
	
	AI_Output	(other,self ,"DIA_GornOW_Hello_15_00");	//Hai oziato abbastanza, sei libero!
	AI_Output 	(self ,other,"DIA_GornOW_Hello_12_01"); //Era ora che qualcuno mi facesse uscire da qui.
	AI_Output	(self ,other,"DIA_GornOW_Hello_12_02");	//Certo, non mi sarei mai aspettato che fossi proprio tu. È bello rivederti.
	AI_Output	(other,self ,"DIA_GornOW_Hello_15_03");	//(ghigno) Garond dice che mangi troppo e che non può più permettersi di nutrirti.
	AI_Output	(self ,other,"DIA_GornOW_Hello_12_04");	//Ora che mi ci fai pensare, gradirei un paio di birre. Usciamo da qui, ne ho abbastanza di questa cella.
	
	if (other.guild == GIL_SLD)
	{
		AI_Output (self ,other,"DIA_GornOW_Add_12_00"); //Aspetta, ho qui qualcosa che potrebbe tornarti utile.
		AI_Output (self ,other,"DIA_GornOW_Add_12_01"); //Ho trovato quest'armatura qui in cella. Qualche prigioniero deve averla nascosta qui.
		B_GiveInvItems (self, other, itar_sld_M, 1);
		AI_Output (self ,other,"DIA_GornOW_Add_12_02"); //È troppo piccola per me, ma a te potrebbe andare bene...
		AI_Output (other,self ,"DIA_GornOW_Add_15_03"); //Grazie! Ci vediamo da Milten...
	}
	else
	{
		AI_Output 	(other,self ,"DIA_GornOW_Hello_15_05");	//D'accordo, ci vediamo da Milten.
	};
	AI_Output	(self ,other,"DIA_GornOW_Hello_12_06");	//Sicuro.
	
	AI_StopProcessInfos (self);
	
	Npc_ExchangeRoutine	(self,"FREE"); 
	B_StartOtherRoutine (Milten,"GORNFREE");
	MIS_RescueGorn = LOG_SUCCESS;
	B_GivePlayerXP (XP_RescueGorn);
};

// ************************************************************
// 			Bei Milten
// ************************************************************
INSTANCE DIA_GornOW_MetMilten (C_INFO)
{
	npc			= PC_Fighter_OW;
	nr			= 2;
	condition	= DIA_GornOW_MetMilten_Condition;
	information	= DIA_GornOW_MetMilten_Info;
	permanent	= FALSE;
	IMPORTANT 	= TRUE;
};                       

FUNC INT DIA_GornOW_MetMilten_Condition()
{
	if (Mis_RescueGorn == LOG_SUCCESS)
	&& (Npc_GetDistToWP	(self,"OC_MAGE_LIBRARY_IN") <=	500) 
	&&  Npc_IsInState (self, ZS_Talk)
	&& (Kapitel == 2)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_GornOW_MetMilten_Info()
{	
	AI_Output (self ,other,"DIA_GornOW_MetMilten_12_00");//Ascolta, ho oziato quaggiù troppo a lungo. È ora che io veda qualcos'altro oltre a questa valle.
	AI_Output (self ,other,"DIA_GornOW_MetMilten_12_01");//Come hai fatto ad attraversare il passo?
	AI_Output (other, self,"DIA_GornOW_MetMilten_15_02");//C'è un sentiero che attraversa la miniera abbandonata.
	AI_Output (self ,other,"DIA_GornOW_MetMilten_12_03");//Bene, aspetterò il momento giusto e poi me ne andrò.
	
	if (other.guild != GIL_SLD)
	{
		AI_Output (other, self,"DIA_GornOW_MetMilten_15_04");//Dove andrai poi?
		AI_Output (self ,other,"DIA_GornOW_MetMilten_12_05");//Ho sentito dire che Lee è ancora vivo. Voglio nuovamente unirmi a lui.
	}
	else
	{
		AI_Output (other, self,"DIA_GornOW_MetMilten_15_06");//Allora vai alla fattoria di Onar, Lee e i suoi ragazzi si trovano lì. Ha bisogno di uomini abili come te.
		AI_Output (self ,other,"DIA_GornOW_MetMilten_12_07");//Lo farò. Andrò a controllare come stanno.
	};
};	

// ************************************************************
// 	Perm Kap.2
// ************************************************************
INSTANCE DIA_GornOW_SeeYou (C_INFO)
{
	npc			= PC_Fighter_OW;
	nr			= 900;
	condition	= DIA_GornOW_SeeYou_Condition;
	information	= DIA_GornOW_Seeyou_Info;
	permanent	= TRUE;
	description = "Ci rivedremo.";
};                       
FUNC INT DIA_GornOW_SeeYou_Condition()
{
	if Npc_KnowsInfo (other,DIA_GornOW_MetMilten)
	&& (Kapitel == 2)
	{	
		return TRUE;
	};
};
 
FUNC VOID DIA_GornOW_SeeYou_Info()
{	
	AI_Output	(other,self ,"DIA_GornOW_SeeYou_15_00");//Ci rivedremo.
	AI_Output	(self ,other,"DIA_GornOW_SeeYou_12_01");//Puoi contarci.
	
	/*
	if (other.guild == GIL_KDF)
	{
		AI_Output	(self ,other,"DIA_GornOW_SeeYou_12_01");//
	}
	else if (other.guild == GIL_MIL)
	{
		AI_Output	(self ,other,"DIA_GornOW_SeeYou_12_01");//
	}
	else //SLD
	{
		AI_Output	(self ,other,"DIA_GornOW_SeeYou_12_01");//
	};
	*/
	AI_StopProcessInfos (self);
};	
