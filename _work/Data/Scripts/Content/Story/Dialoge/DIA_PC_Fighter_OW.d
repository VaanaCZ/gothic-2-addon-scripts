
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
	
	AI_Output	(other,self ,"DIA_GornOW_Hello_15_00");	//Assez paressé, vous voilà libre !
	AI_Output 	(self ,other,"DIA_GornOW_Hello_12_01"); //Pas trop tôt ! Il était grand temps qu’on me fasse sortir d’ici.
	AI_Output	(self ,other,"DIA_GornOW_Hello_12_02");	//Par contre, je ne m’attendais pas à ce que ce soit vous. Ça me fait sacrément plaisir de vous voir.
	AI_Output	(other,self ,"DIA_GornOW_Hello_15_03");	//(sourit) Garond dit que vous mangez trop et qu’il ne peut plus se permettre de vous nourrir gratuitement.
	AI_Output	(self ,other,"DIA_GornOW_Hello_12_04");	//Maintenant que vous m'y faites penser, je boirais bien une bière ou deux. Fichons le camp d'ici, j'en ai plus qu'assez de cette cellule !
	
	if (other.guild == GIL_SLD)
	{
		AI_Output (self ,other,"DIA_GornOW_Add_12_00"); //Attendez, j’ai là quelque chose qui devrait vous être utile.
		AI_Output (self ,other,"DIA_GornOW_Add_12_01"); //J’ai trouvé cette armure dans la cellule. Un prisonnier avait dû la cacher ici.
		B_GiveInvItems (self, other, itar_sld_M, 1);
		AI_Output (self ,other,"DIA_GornOW_Add_12_02"); //Elle est trop petite pour moi, mais peut-être qu’elle vous irait...
		AI_Output (other,self ,"DIA_GornOW_Add_15_03"); //Merci. Je vous rejoins chez Milten.
	}
	else
	{
		AI_Output 	(other,self ,"DIA_GornOW_Hello_15_05");	//D’accord. On se retrouve là-bas.
	};
	AI_Output	(self ,other,"DIA_GornOW_Hello_12_06");	//Pas de problème.
	
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
	AI_Output (self ,other,"DIA_GornOW_MetMilten_12_00");//Bon, je n’ai que trop traîné dans le coin. Il est grand temps de voir autre chose que cette vallée.
	AI_Output (self ,other,"DIA_GornOW_MetMilten_12_01");//Comment avez-vous réussi à franchir le col ?
	AI_Output (other, self,"DIA_GornOW_MetMilten_15_02");//Il existe un passage par la mine abandonnée...
	AI_Output (self ,other,"DIA_GornOW_MetMilten_12_03");//Bien. J’attends le moment opportun et je file.
	
	if (other.guild != GIL_SLD)
	{
		AI_Output (other, self,"DIA_GornOW_MetMilten_15_04");//Où comptez-vous aller ?
		AI_Output (self ,other,"DIA_GornOW_MetMilten_12_05");//J’ai entendu dire que Lee était encore en vie. J’aimerais bien le retrouver.
	}
	else
	{
		AI_Output (other, self,"DIA_GornOW_MetMilten_15_06");//Dans ce cas, allez à la ferme d’Onar. C’est là que se trouvent Lee et ses hommes. Il a besoin d’hommes de confiance tels que vous.
		AI_Output (self ,other,"DIA_GornOW_MetMilten_12_07");//C’est ce que je vais faire. Comme ça je verrai bien comment ils se débrouillent là-bas.
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
	description = "Nous nous reverrons.";
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
	AI_Output	(other,self ,"DIA_GornOW_SeeYou_15_00");//Nous nous reverrons.
	AI_Output	(self ,other,"DIA_GornOW_SeeYou_12_01");//Vous pouvez y compter.
	
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
