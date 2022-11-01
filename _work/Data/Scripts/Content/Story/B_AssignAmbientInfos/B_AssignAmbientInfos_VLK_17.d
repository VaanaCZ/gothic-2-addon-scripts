// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_VLK_17_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_VLK_17_EXIT_Condition;
	information	= DIA_VLK_17_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_VLK_17_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_VLK_17_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									JOIN
// *************************************************************************
INSTANCE DIA_VLK_17_JOIN(C_INFO)
{
	nr			= 4;
	condition	= DIA_VLK_17_JOIN_Condition;
	information	= DIA_VLK_17_JOIN_Info;
	permanent	= TRUE;
	description = "Che cosa devo fare per diventare un cittadino di questa città?";
};                       

FUNC INT DIA_VLK_17_JOIN_Condition()
{
	if (hero.guild == GIL_NONE)
	&& (Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_VLK_17_JOIN_Info()
{	
	AI_Output (other, self, "DIA_VLK_17_JOIN_15_00"); //Che cosa devo fare per diventare un cittadino di questa città?
	AI_Output (self, other, "DIA_VLK_17_JOIN_17_01"); //I maestri artigiani nella parte bassa della città hanno una grande influenza qui a Khorinis. Dovresti andare a parlare con uno di loro.
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_VLK_17_PEOPLE(C_INFO)
{
	nr			= 3;
	condition	= DIA_VLK_17_PEOPLE_Condition;
	information	= DIA_VLK_17_PEOPLE_Info;
	permanent	= TRUE;
	description = "Quali sono le personalità più importanti in questa città?";
};                       

FUNC INT DIA_VLK_17_PEOPLE_Condition()
{
	return TRUE;
};

FUNC VOID DIA_VLK_17_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_VLK_17_PEOPLE_15_00"); //Quali sono le personalità più importanti in questa città?
	AI_Output (self, other, "DIA_VLK_17_PEOPLE_17_01"); //Da quando sono arrivati i paladini, hanno assunto il controllo su tutta la città.
	AI_Output (self, other, "DIA_VLK_17_PEOPLE_17_02"); //Lord Andre rappresenta la legge. Puoi trovarlo nella caserma.
	AI_Output (self, other, "DIA_VLK_17_PEOPLE_17_03"); //Ma devi andare da lui solo se hai infranto la legge o se vuoi arruolarti nella guardia cittadina.
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_VLK_17_LOCATION(C_INFO)
{
	nr			= 2;
	condition	= DIA_VLK_17_LOCATION_Condition;
	information	= DIA_VLK_17_LOCATION_Info;
	permanent	= TRUE;
	description = "Quali sono i luoghi più interessanti, qui a Khorinis?";
};                       

FUNC INT DIA_VLK_17_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_VLK_17_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_VLK_17_LOCATION_15_00"); //Quali sono i luoghi più interessanti, qui a Khorinis?
	AI_Output (self, other, "DIA_VLK_17_LOCATION_17_01"); //(ride) Forse avresti fatto meglio a chiederlo a un uomo. Se vuoi divertirti, prova ad andare al porto.
	AI_Output (self, other, "DIA_VLK_17_LOCATION_17_02"); //Ma se vuoi acquistare qualcosa, vai al mercato al cancello est, o nella parte bassa della città.
};

// *************************************************************************
// 									NEWS
// *************************************************************************
INSTANCE DIA_VLK_17_STANDARD(C_INFO)
{
	nr			= 1;
	condition	= DIA_VLK_17_STANDARD_Condition;
	information	= DIA_VLK_17_STANDARD_Info;
	permanent	= TRUE;
	description = "Novità?";
};                       
func INT DIA_VLK_17_STANDARD_Condition()
{
	return TRUE;
};
FUNC VOID DIA_VLK_17_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_VLK_17_STANDARD_15_00"); //Novità?
		
	if (Kapitel == 1)
	|| (Kapitel == 2)
	{
		AI_Output (self,other,"DIA_VLK_17_STANDARD_17_01"); //Mi chiedo cosa ci facciano qui i paladini. Hanno assunto il controllo della parte alta della città, della caserma e del porto, ma finora non hanno ancora fatto niente.
		AI_Output (self,other,"DIA_VLK_17_STANDARD_17_02"); //Se fossero qui per via degli orchi o dei briganti, avrebbero dovuto fare qualcosa già parecchio tempo fa. Deve esserci un'altra ragione...
	};
	
	if (Kapitel == 3)
	{
		AI_Output (self,other,"DIA_VLK_17_STANDARD_17_03"); //Ho appena scoperto che ci fanno qui i paladini. Sono interessati al metallo. Farebbero meglio a difendere la nostra città, piuttosto.
	};

	if (Kapitel == 4)
	{
		AI_Output (self,other,"DIA_VLK_17_STANDARD_17_04"); //Spero ci sia un fondo di verità in quelle storie sui draghi. A quel punto Lord Hagen sarebbe costretto a fare qualcosa. Non può lasciarci qui da soli, in balia dei draghi.
	};
	
	if (Kapitel == 5)
	{
		AI_Output (self,other,"DIA_VLK_17_STANDARD_17_05"); //Ora che i draghi sono morti, i paladini elimineranno in fretta le canaglie rimaste.
	};
};


// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_VLK_17 (var c_NPC slf)
{
	DIA_VLK_17_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_VLK_17_JOIN.npc					= Hlp_GetInstanceID(slf);
	DIA_VLK_17_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_VLK_17_LOCATION.npc				= Hlp_GetInstanceID(slf);
	DIA_VLK_17_STANDARD.npc				= Hlp_GetInstanceID(slf);
};
