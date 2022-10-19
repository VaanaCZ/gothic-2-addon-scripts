// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_VLK_8_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_VLK_8_EXIT_Condition;
	information	= DIA_VLK_8_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_VLK_8_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_VLK_8_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									JOIN
// *************************************************************************
INSTANCE DIA_VLK_8_JOIN(C_INFO)
{
	nr			= 4;
	condition	= DIA_VLK_8_JOIN_Condition;
	information	= DIA_VLK_8_JOIN_Info;
	permanent	= TRUE;
	description = "�Quiero convertirme en ciudadano!";
};                       

FUNC INT DIA_VLK_8_JOIN_Condition()
{
	if (hero.guild == GIL_NONE)
	&& (Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_VLK_8_JOIN_Info()
{	
	AI_Output (other, self, "DIA_VLK_8_JOIN_15_00"); //�Quiero convertirme en ciudadano!
	AI_Output (self, other, "DIA_VLK_8_JOIN_08_01"); //�Y a m� qu� me cuentas? Ve a ver a uno de los maestros artesanos de la parte baja de la ciudad. Si tienes suerte, a lo mejor uno de ellos busca un aprendiz.
	AI_Output (self, other, "DIA_VLK_8_JOIN_08_02"); //Si no, tendr�s que ir a ver al gobernador e inscribirte como ciudadano.
	AI_Output (self, other, "DIA_VLK_8_JOIN_08_03"); //No obstante, olv�date del asunto. Desde la llegada de los paladines, el gobernador ha dejado de estar al cargo.
	AI_Output (self, other, "DIA_VLK_8_JOIN_08_04"); //Y seguro que su l�der, lord Hagen, no tiene tiempo para cosas as�.
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_VLK_8_PEOPLE(C_INFO)
{
	nr			= 3;
	condition	= DIA_VLK_8_PEOPLE_Condition;
	information	= DIA_VLK_8_PEOPLE_Info;
	permanent	= TRUE;
	description = "�Qui�nes son los ciudadanos m�s importantes?";
};                       

FUNC INT DIA_VLK_8_PEOPLE_Condition()
{
	return TRUE;
};

FUNC VOID DIA_VLK_8_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_VLK_8_PEOPLE_15_00"); //�Qui�nes son los ciudadanos m�s importantes?
	AI_Output (self, other, "DIA_VLK_8_PEOPLE_08_01"); //Adem�s de los paladines... los maestros artesanos de la parte baja de la ciudad. Todos ellos son muy importantes.
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_VLK_8_LOCATION(C_INFO)
{
	nr			= 2;
	condition	= DIA_VLK_8_LOCATION_Condition;
	information	= DIA_VLK_8_LOCATION_Info;
	permanent	= TRUE;
	description = "�Qu� cosas interesantes hay aqu� para ver?";
};                       

FUNC INT DIA_VLK_8_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_VLK_8_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_VLK_8_LOCATION_15_00"); //�Qu� cosas interesantes hay aqu� para ver?
	AI_Output (self, other, "DIA_VLK_8_LOCATION_08_01"); //En el puerto est� el gran barco en el que llegaron los paladines. �Es un nav�o enorme! Merece la pena echarle un vistazo.
	AI_Output (self, other, "DIA_VLK_8_LOCATION_08_02"); //No obstante, no creo que te dejen subir a bordo. Los paladines vigilan el barco como si fuesen las joyas de la corona.
	AI_Output (self, other, "DIA_VLK_8_LOCATION_08_03"); //No me extra�a. Es el �nico barco en condiciones de navegar en muchos kil�metros a la redonda.
};

// *************************************************************************
// 									NEWS
// *************************************************************************
INSTANCE DIA_VLK_8_STANDARD(C_INFO)
{
	nr			= 1;
	condition	= DIA_VLK_8_STANDARD_Condition;
	information	= DIA_VLK_8_STANDARD_Info;
	permanent	= TRUE;
	description = "�Qu� hay de nuevo?";
};                       
func INT DIA_VLK_8_STANDARD_Condition()
{
	return TRUE;
};
FUNC VOID DIA_VLK_8_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_VLK_8_STANDARD_15_00"); //�Qu� hay de nuevo?
		
	if (Kapitel == 1)
	{
		AI_Output (self,other,"DIA_Addon_VLK_8_STANDARD_08_00"); //Todo el mundo anda preocupado �ltimamente.
		AI_Output (self,other,"DIA_Addon_VLK_8_STANDARD_08_01"); //Por si no bastara con que los paladines se hayan acomodado aqu�, ahora empieza a desaparecer gente de la forma m�s extra�a.
		AI_Output (self,other,"DIA_Addon_VLK_8_STANDARD_08_02"); //Ya es hora de que la milicia haga algo al respecto.
			if (SC_HearedAboutMissingPeople == FALSE)
			{
				Log_CreateTopic (TOPIC_Addon_WhoStolePeople, LOG_MISSION);
				Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
				B_LogEntry (TOPIC_Addon_WhoStolePeople, LogText_Addon_SCKnowsMisspeapl); 
			};
		SC_HearedAboutMissingPeople = TRUE;
	};
	
	if (Kapitel == 2)
	{
		AI_Output (self,other,"DIA_VLK_8_STANDARD_08_01"); //Todo el mundo espera a que los paladines anuncien a qu� han venido. Sospecho que es por los orcos. �Seguro que atacan pronto!
		AI_Output (self,other,"DIA_VLK_8_STANDARD_08_02"); //Puede que los paladines cuenten con la bendici�n de Innos, pero cuando aparezcan las hordas orcas, llegar� nuestro fin.
	};
	
	if (Kapitel == 3)
	{
		AI_Output (self,other,"DIA_VLK_8_STANDARD_08_03"); //Se rumorea que los paladines solo han venido para llevarse todo el mineral de la isla. Se dice que es para la guerra en el continente.
		AI_Output (self,other,"DIA_VLK_8_STANDARD_08_04"); //�Sabes lo que significa eso? Al rey le importa un bledo que muramos miserablemente cuando ataquen los orcos.
		AI_Output (self,other,"DIA_VLK_8_STANDARD_08_05"); //Cuando los paladines leven anclas, me asegurar� de estar a bordo del barco.
	};

	if (Kapitel == 4)
	{
		AI_Output (self,other,"DIA_VLK_8_STANDARD_08_06"); //�Se rumorea que los orcos vienen a lomos de dragones tan grandes como la mitad de la ciudad! �No tenemos ninguna oportunidad!
	};
	
	if (Kapitel >= 5)
	{
		AI_Output (self,other,"DIA_VLK_8_STANDARD_08_07"); //La gente dice que los dragones han sido vencidos. �Ser� verdad?
	};
};


// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_VLK_8 (var c_NPC slf)
{
	DIA_VLK_8_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_VLK_8_JOIN.npc					= Hlp_GetInstanceID(slf);
	DIA_VLK_8_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_VLK_8_LOCATION.npc				= Hlp_GetInstanceID(slf);
	DIA_VLK_8_STANDARD.npc				= Hlp_GetInstanceID(slf);
};
