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
	description = "�Qu� tengo que hacer para convertirme en ciudadano?";
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
	AI_Output (other, self, "DIA_VLK_17_JOIN_15_00"); //�Qu� tengo que hacer para convertirme en ciudadano?
	AI_Output (self, other, "DIA_VLK_17_JOIN_17_01"); //Los artesanos de la parte baja de la ciudad tienen mucha influencia en Khorinis. Habla con uno de ellos.
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
	description = "�Qui�nes son las personalidades de la ciudad?";
};                       

FUNC INT DIA_VLK_17_PEOPLE_Condition()
{
	return TRUE;
};

FUNC VOID DIA_VLK_17_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_VLK_17_PEOPLE_15_00"); //�Qui�nes son las personalidades de la ciudad?
	AI_Output (self, other, "DIA_VLK_17_PEOPLE_17_01"); //Los paladines tomaron el control de toda la ciudad en cuanto llegaron.
	AI_Output (self, other, "DIA_VLK_17_PEOPLE_17_02"); //Lord Andre representa la ley. Lo encontrar�s en el cuartel.
	AI_Output (self, other, "DIA_VLK_17_PEOPLE_17_03"); //Pero solo tienes que presentarte ante �l si has infringido la ley o si quieres enrolarte en la milicia.
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
	description = "�Qu� lugares son los m�s interesantes en Khorinis?";
};                       

FUNC INT DIA_VLK_17_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_VLK_17_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_VLK_17_LOCATION_15_00"); //�Qu� lugares son los m�s interesantes en Khorinis?
	AI_Output (self, other, "DIA_VLK_17_LOCATION_17_01"); //(Se r�e) Ser�a mejor que se lo preguntases a un hombre. Si quieres diversi�n, prueba en el puerto.
	AI_Output (self, other, "DIA_VLK_17_LOCATION_17_02"); //Pero si quieres comprar algo, ve al mercado de la puerta este o a la parte baja de la ciudad.
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
	description = "�Qu� hay de nuevo?";
};                       
func INT DIA_VLK_17_STANDARD_Condition()
{
	return TRUE;
};
FUNC VOID DIA_VLK_17_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_VLK_17_STANDARD_15_00"); //�Qu� hay de nuevo?
		
	if (Kapitel == 1)
	|| (Kapitel == 2)
	{
		AI_Output (self,other,"DIA_VLK_17_STANDARD_17_01"); //Me pregunto qu� hacen aqu� los paladines. Controlan el ayuntamiento, el cuartel y el puerto, pero hasta el momento no han hecho nada.
		AI_Output (self,other,"DIA_VLK_17_STANDARD_17_02"); //Si hubieran venido por los orcos y los bandidos, habr�an hecho algo hace siglos. Debe de haber otro motivo...
	};
	
	if (Kapitel == 3)
	{
		AI_Output (self,other,"DIA_VLK_17_STANDARD_17_03"); //Ya s� a qu� han venido los paladines. Todo tiene que ver con el mineral. Ser�a mejor que se dedicaran a defender la ciudad.
	};

	if (Kapitel == 4)
	{
		AI_Output (self,other,"DIA_VLK_17_STANDARD_17_04"); //Espero que haya algo de cierto en esas historias de dragones. Lord Hagen se ver�a obligado a hacer algo. No nos puede entregar a los dragones.
	};
	
	if (Kapitel == 5)
	{
		AI_Output (self,other,"DIA_VLK_17_STANDARD_17_05"); //Ahora que los dragones han muerto, los paladines no tardar�n en despachar al resto de la gentuza.
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
