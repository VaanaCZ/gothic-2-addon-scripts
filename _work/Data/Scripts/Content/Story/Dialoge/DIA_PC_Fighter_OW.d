
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
	
	AI_Output	(other,self ,"DIA_GornOW_Hello_15_00");	//Assez paress�, vous voil� libre !
	AI_Output 	(self ,other,"DIA_GornOW_Hello_12_01"); //Pas trop t�t ! Il �tait grand temps qu�on me fasse sortir d�ici.
	AI_Output	(self ,other,"DIA_GornOW_Hello_12_02");	//Par contre, je ne m�attendais pas � ce que ce soit vous. �a me fait sacr�ment plaisir de vous voir.
	AI_Output	(other,self ,"DIA_GornOW_Hello_15_03");	//(sourit) Garond dit que vous mangez trop et qu�il ne peut plus se permettre de vous nourrir gratuitement.
	AI_Output	(self ,other,"DIA_GornOW_Hello_12_04");	//Maintenant que vous m'y faites penser, je boirais bien une bi�re ou deux. Fichons le camp d'ici, j'en ai plus qu'assez de cette cellule !
	
	if (other.guild == GIL_SLD)
	{
		AI_Output (self ,other,"DIA_GornOW_Add_12_00"); //Attendez, j�ai l� quelque chose qui devrait vous �tre utile.
		AI_Output (self ,other,"DIA_GornOW_Add_12_01"); //J�ai trouv� cette armure dans la cellule. Un prisonnier avait d� la cacher ici.
		B_GiveInvItems (self, other, itar_sld_M, 1);
		AI_Output (self ,other,"DIA_GornOW_Add_12_02"); //Elle est trop petite pour moi, mais peut-�tre qu�elle vous irait...
		AI_Output (other,self ,"DIA_GornOW_Add_15_03"); //Merci. Je vous rejoins chez Milten.
	}
	else
	{
		AI_Output 	(other,self ,"DIA_GornOW_Hello_15_05");	//D�accord. On se retrouve l�-bas.
	};
	AI_Output	(self ,other,"DIA_GornOW_Hello_12_06");	//Pas de probl�me.
	
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
	AI_Output (self ,other,"DIA_GornOW_MetMilten_12_00");//Bon, je n�ai que trop tra�n� dans le coin. Il est grand temps de voir autre chose que cette vall�e.
	AI_Output (self ,other,"DIA_GornOW_MetMilten_12_01");//Comment avez-vous r�ussi � franchir le col ?
	AI_Output (other, self,"DIA_GornOW_MetMilten_15_02");//Il existe un passage par la mine abandonn�e...
	AI_Output (self ,other,"DIA_GornOW_MetMilten_12_03");//Bien. J�attends le moment opportun et je file.
	
	if (other.guild != GIL_SLD)
	{
		AI_Output (other, self,"DIA_GornOW_MetMilten_15_04");//O� comptez-vous aller ?
		AI_Output (self ,other,"DIA_GornOW_MetMilten_12_05");//J�ai entendu dire que Lee �tait encore en vie. J�aimerais bien le retrouver.
	}
	else
	{
		AI_Output (other, self,"DIA_GornOW_MetMilten_15_06");//Dans ce cas, allez � la ferme d�Onar. C�est l� que se trouvent Lee et ses hommes. Il a besoin d�hommes de confiance tels que vous.
		AI_Output (self ,other,"DIA_GornOW_MetMilten_12_07");//C�est ce que je vais faire. Comme �a je verrai bien comment ils se d�brouillent l�-bas.
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
