
// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Sengrath_EXIT(C_INFO)
{
	npc			= PAL_267_Sengrath;
	nr			= 999;
	condition	= DIA_Sengrath_EXIT_Condition;
	information	= DIA_Sengrath_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Sengrath_EXIT_Condition()
{
	return TRUE;
};
 
FUNC VOID DIA_Sengrath_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 			  			Hallo
// ************************************************************
INSTANCE DIA_Sengrath_Hello (C_INFO)
{
	npc			= PAL_267_Sengrath;
	nr			= 2;
	condition	= DIA_Sengrath_Hello_Condition;
	information	= DIA_Sengrath_Hello_Info;
	permanent	= FALSE;
	IMPORTANT 	= TRUE;
};                       

FUNC INT DIA_Sengrath_Hello_Condition()
{
	return TRUE;
};	 
FUNC VOID DIA_Sengrath_Hello_Info()
{	
	AI_Output (self ,other,"DIA_Sengrath_Hello_03_00"); //Je le savais ! Je savais bien que quelqu'un y arriverait !
	AI_Output (self ,other,"DIA_Sengrath_Hello_03_01"); //Avez-vous franchi le col ? Mais alors, notre messager a réussi à passer ?
	AI_Output (other ,self,"DIA_Sengrath_Hello_15_02"); //Non, il n'est pas passé. Je suis venu sur ordre du seigneur Hagen.
	AI_Output (self ,other,"DIA_Sengrath_Hello_03_03"); //(grogne) Maudits orques !
	AI_Output (self ,other,"DIA_Sengrath_Hello_03_04"); //Le commandant Garond va sans doute vouloir vous parler. Vous le trouverez dans le grand bâtiment gardé par deux chevaliers.
};
// ************************************************************
// 			  	Equipment 
// ************************************************************
INSTANCE DIA_Sengrath_Equipment (C_INFO)
{
	npc			= PAL_267_Sengrath;
	nr			= 2;
	condition	= DIA_Sengrath_Equipment_Condition;
	information	= DIA_Sengrath_Equipment_Info;
	permanent	= FALSE;
	description = "Où puis-je trouver de l'équipement ici ?";
};                       

FUNC INT DIA_Sengrath_Equipment_Condition()
{
	return TRUE;
};	 
FUNC VOID DIA_Sengrath_Equipment_Info()
{	
	AI_Output (other ,self,"DIA_Sengrath_Equipment_15_00"); //Où puis-je m'équiper ici ?
	AI_Output (self ,other,"DIA_Sengrath_Equipment_03_01"); //Tandor est chargé des armes. Pour tout le reste, c'est Engor qu'il faut aller trouver.
	AI_Output (other ,self,"DIA_Sengrath_Equipment_15_02"); //Et l'équipement magique ?
	AI_Output (self ,other,"DIA_Sengrath_Equipment_03_03"); //Nous avons des parchemins magiques. S'ils vous intéressent, faites-le moi savoir.
	
	Log_CreateTopic (TOPIC_Trader_OC,LOG_NOTE);
	B_LogEntry (TOPIC_Trader_OC,"Sengrath vend des parchemins de sort dans le château.");
};
// ************************************************************
// 			  	Lehrer
// ************************************************************
INSTANCE DIA_Sengrath_Perm (C_INFO)
{
	npc			= PAL_267_Sengrath;
	nr			= 2;
	condition	= DIA_Sengrath_Perm_Condition;
	information	= DIA_Sengrath_Perm_Info;
	permanent	= FALSE;
	description = "Qui peut m'enseigner des techniques ici ?";
};                       

FUNC INT DIA_Sengrath_Perm_Condition()
{	
		return TRUE;
};
FUNC VOID DIA_Sengrath_Perm_Info()
{	
	AI_Output (other ,self,"DIA_Sengrath_Perm_15_00"); //Qui prodigue son enseignement ici ?
	
	if (other.guild == GIL_KDF)
	&& (Kapitel == 2)
	{
		AI_Output (self ,other,"DIA_Sengrath_Perm_03_01"); //Allez voir Milten, c'est le seul magicien que nous ayons ici.
	}
	else
	{
		AI_Output (self ,other,"DIA_Sengrath_Perm_03_02"); //Demandez à Kéroloth. C'est lui qui enseigne l'escrime à nos nouvelles recrues. Peut-être aura-t-il également des choses à vous apprendre.
		
		Log_CreateTopic (TOPIC_Teacher_OC,LOG_NOTE);
		B_LogEntry (TOPIC_Teacher_OC,"Au château, Kéroloth entraîne les spadassins.");
	};
};
// ************************************************************
// 			Scrolls
// ************************************************************
INSTANCE DIA_Sengrath_Scrolls (C_INFO)
{
	npc			= PAL_267_Sengrath;
	nr			= 9;
	condition	= DIA_Sengrath_Scrolls_Condition;
	information	= DIA_Sengrath_Scrolls_Info;
	permanent	= TRUE;
	trade		= TRUE;
	description = "Montrez-moi vos parchemins de sort.";

};                       

FUNC INT DIA_Sengrath_Scrolls_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Sengrath_Equipment)
	{
		return TRUE;
	};	 
};
FUNC VOID DIA_Sengrath_Scrolls_Info()
{	
	B_GiveTradeInv (self);
	AI_Output (other ,self,"DIA_Sengrath_Scrolls_15_00"); //Montrez-moi vos parchemins magiques.
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Sengrath_PICKPOCKET (C_INFO)
{
	npc			= PAL_267_Sengrath;
	nr			= 900;
	condition	= DIA_Sengrath_PICKPOCKET_Condition;
	information	= DIA_Sengrath_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Sengrath_PICKPOCKET_Condition()
{
	C_Beklauen (32, 35);
};
 
FUNC VOID DIA_Sengrath_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Sengrath_PICKPOCKET);
	Info_AddChoice		(DIA_Sengrath_PICKPOCKET, DIALOG_BACK 		,DIA_Sengrath_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Sengrath_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Sengrath_PICKPOCKET_DoIt);
};

func void DIA_Sengrath_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Sengrath_PICKPOCKET);
};
	
func void DIA_Sengrath_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Sengrath_PICKPOCKET);
};



