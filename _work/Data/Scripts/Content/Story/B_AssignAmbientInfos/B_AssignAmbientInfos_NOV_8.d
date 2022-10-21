// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_NOV_8_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_NOV_8_EXIT_Condition;
	information	= DIA_NOV_8_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_NOV_8_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NOV_8_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// *************************************************************************
// 		Fegen
// *************************************************************************
INSTANCE DIA_NOV_8_Fegen(C_INFO)
{
	nr			= 2;
	condition	= DIA_NOV_8_Fegen_Condition;
	information	= DIA_NOV_8_Fegen_Info;
	permanent	= TRUE;
	description = "Necesito ayuda para peinar las estancias de los novicios.";
};                       

FUNC INT DIA_NOV_8_Fegen_Condition()
{
	if (Kapitel == 1)
	&& (MIS_KlosterArbeit == LOG_RUNNING)
	&& (NOV_Helfer < 4)
	{
		return TRUE;
	};
};
//-------------------------------
var int Feger3_Permanent;
//-------------------------------
FUNC VOID DIA_NOV_8_Fegen_Info()
{	
	AI_Output (other, self, "DIA_NOV_8_Fegen_15_00"); //Necesito ayuda para registrar las estancias de los novicios.
	
	if (Hlp_GetInstanceID (Feger3) == Hlp_GetInstanceID (self))
	{	
		if (Feger3_Permanent == FALSE)
		{
			AI_Output (self, other, "DIA_NOV_8_Fegen_08_01"); //Vaya. �Acabas de llegar y ya te encargan esa labor?
			AI_Output (self, other, "DIA_NOV_8_Fegen_08_02"); //Consu�late. A m� me pas� lo mismo cuando llegu� y por eso voy a ayudarte. Ser�a absurdo que no pudi�ramos con ello.
			
			NOV_Helfer = (NOV_Helfer +1);
			Feger3_Permanent = TRUE;
			B_GivePlayerXP (XP_Feger);
			AI_StopProcessInfos (self);
			Npc_ExchangeRoutine (self,"FEGEN");
			
			B_LogEntry 	(Topic_ParlanFegen,"He encontrado un novicio dispuesto a ayudarme a barrer las c�maras.");
		}
		else //if (Feger3_Permanent == TRUE)
		{
			AI_Output (self, other, "DIA_NOV_8_Fegen_08_03"); //Hermano, s� por lo que est�s pasando. Ya te dije que te ayudar� y eso es lo hago.
		};
	};
	//-------------------------- alle anderen Novizen mit Stimme 8 -----------------------------------------------------
	
	if ((Hlp_GetInstanceID (Feger3) == Hlp_GetInstanceID (self)) == FALSE )
	{	
		AI_Output (self, other, "DIA_NOV_8_Fegen_08_04"); //Lo har�a, pero estoy muy ocupado.
	};
};
// *************************************************************************
// 							Wurst verteilen
// *************************************************************************
INSTANCE DIA_NOV_8_Wurst(C_INFO)
{
	nr			= 3;
	condition	= DIA_NOV_8_Wurst_Condition;
	information	= DIA_NOV_8_Wurst_Info;
	permanent	= TRUE;
	description = "�Te apetece una deliciosa salchicha de cordero?";
};                       

FUNC INT DIA_NOV_8_Wurst_Condition()
{
	if (Kapitel == 1)
	&& (MIS_GoraxEssen == LOG_RUNNING)
	&& (Npc_HasItems (self, ItFo_SchafsWurst ) == 0)
	&& (Npc_HasItems (other, ItFo_SchafsWurst ) >= 1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NOV_8_Wurst_Info()
{	
	AI_Output (other, self, "DIA_NOV_8_Wurst_15_00"); //�Te apetece una deliciosa salchicha de cordero?
	AI_Output (self, other, "DIA_NOV_8_Wurst_08_01"); //No voy a decir que no. Gracias, t�o. Me viene de miedo.
	
	B_GiveInvItems (other, self, ItFo_SchafsWurst, 1);
	Wurst_Gegeben = (Wurst_Gegeben +1);
	
	CreateInvItems (self, ITFO_Sausage,1);
	B_UseItem (self, ITFO_Sausage);
	
	var string NovizeText;
	var string NovizeLeft;
	NovizeLeft = IntToString (13 - Wurst_Gegeben);
	NovizeText = ConcatStrings(NovizeLeft, PRINT_NovizenLeft);
	AI_PrintScreen	(NovizeText, -1, YPOS_GOLDGIVEN, FONT_ScreenSmall, 2);
};
// *************************************************************************
// 									JOIN
// *************************************************************************
INSTANCE DIA_NOV_8_JOIN(C_INFO)
{
	nr			= 4;
	condition	= DIA_NOV_8_JOIN_Condition;
	information	= DIA_NOV_8_JOIN_Info;
	permanent	= TRUE;
	description = "�Qu� he de hacer para convertirme en mago?";
};                       

FUNC INT DIA_NOV_8_JOIN_Condition()
{
	if (hero.guild == GIL_NOV)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NOV_8_JOIN_Info()
{	
	AI_Output (other, self, "DIA_NOV_8_JOIN_15_00"); //�Qu� he de hacer para convertirme en mago?
	AI_Output (self, other, "DIA_NOV_8_JOIN_08_01"); //Solo te convertir�s en un elegido de Innos cuando lo permitan los magos supremos de fuego.
	AI_Output (self, other, "DIA_NOV_8_JOIN_08_02"); //Los novicios tenemos prohibido el estudio de la magia r�nica, y solo podemos estudiar las antiguas escrituras con permiso de los magos.
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_NOV_8_PEOPLE(C_INFO)
{
	nr			= 5;
	condition	= DIA_NOV_8_PEOPLE_Condition;
	information	= DIA_NOV_8_PEOPLE_Info;
	permanent	= TRUE;
	description = "�Qui�n est� al mando del monasterio?";
};                       

FUNC INT DIA_NOV_8_PEOPLE_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NOV_8_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_NOV_8_PEOPLE_15_00"); //�Qui�n est� al mando del monasterio?
	AI_Output (self, other, "DIA_NOV_8_PEOPLE_08_01"); //El Concilio Supremo. Lo forman los tres magos m�s poderosos de la orden y se re�nen a diario en el templo.
	AI_Output (self, other, "DIA_NOV_8_PEOPLE_08_02"); //Todos los elegidos de Innos son magos. Innos les ha otorgado su don para que hagan valer su voluntad en la tierra.
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_NOV_8_LOCATION(C_INFO)
{
	nr			= 6;
	condition	= DIA_NOV_8_LOCATION_Condition;
	information	= DIA_NOV_8_LOCATION_Info;
	permanent	= TRUE;
	description = "H�blame del monasterio.";
};                       

FUNC INT DIA_NOV_8_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NOV_8_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_NOV_8_LOCATION_15_00"); //H�blame del monasterio.
	AI_Output (self, other, "DIA_NOV_8_LOCATION_08_01"); //Es antiguo, de la �poca anterior a Rhobar I.
	AI_Output (self, other, "DIA_NOV_8_LOCATION_08_02"); //Las catacumbas est�n debajo del monasterio y penetran en lo m�s hondo de la monta�a.
	//AI_Output (self, other, "DIA_NOV_8_LOCATION_08_03"); //Aber zur untersten Ebene haben nur die h�chsten Geweihten Innos' Zutritt.
};

// *************************************************************************
// 									NEWS
// *************************************************************************
INSTANCE DIA_NOV_8_STANDARD(C_INFO)
{
	nr			= 10;
	condition	= DIA_NOV_8_STANDARD_Condition;
	information	= DIA_NOV_8_STANDARD_Info;
	permanent	= TRUE;
	description = "�Hay alguna novedad?";
};
                       
func INT DIA_NOV_8_STANDARD_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NOV_8_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_NOV_8_STANDARD_15_00"); //�Hay alguna novedad?
		
	if (Kapitel == 1)
	{
		if (other.guild == GIL_KDF)
		{
			AI_Output (self,other,"DIA_NOV_8_STANDARD_08_01"); //En cierto modo. La �ltima vez que un novicio fue aceptado tan deprisa en el C�rculo de Fuego fue hace m�s de cien a�os.
			AI_Output (self,other,"DIA_NOV_8_STANDARD_08_02"); //Espero que alg�n d�a me otorguen ese mismo honor. Me esforzar� al m�ximo.
		}
		else
		{
			AI_Output (self,other,"DIA_NOV_8_STANDARD_08_03"); //Los paladines han llegado hace poco a Khorinis y uno de ellos ha venido a rezar al monasterio.
		};
	};

	if (Kapitel == 2)
	|| (Kapitel == 3)
	{
		if (Pedro_Traitor == TRUE)
		&& (MIS_NovizenChase != LOG_SUCCESS)	//Kap 3b - SC weiss, das Pedro das Auge Innos geklaut hat
		{
	 		AI_Output (self,other,"DIA_NOV_3_STANDARD_08_04"); //A�n no me lo creo. Uno de los nuestros ha traicionado al monasterio y ha robado el Ojo de Innos.
			AI_Output (self,other,"DIA_NOV_3_STANDARD_08_05"); //Nos correspond�a fundar una comunidad, pero flaqueamos. Solo as� podr�a haber atra�do Beliar a uno de los nuestros.
		}
		else if (MIS_NovizenChase == LOG_SUCCESS)	//Kap 3c - Das Auge Innos ist wieder da
		{
			AI_Output (self,other,"DIA_NOV_3_STANDARD_08_06"); //�Alabado sea Innos! Conseguimos recuperar el Ojo de manos del enemigo.
			AI_Output (self,other,"DIA_NOV_3_STANDARD_08_07"); //Tu valent�a puede servir de modelo para muchas almas desesperadas y ayudarlas a sobrevivir en este periodo aciago.
		}
		else //Kap 2 - 3a
		{
			if (MIS_OLDWORLD == LOG_SUCCESS)
			{
				AI_Output (self,other,"DIA_NOV_8_STANDARD_08_08"); //He o�do hablar de dragones y de un ej�rcito mal�fico. �Que Innos nos proteja!
			}
			else
			{
				AI_Output (self,other,"DIA_NOV_8_STANDARD_08_09"); //La situaci�n de nuestros paladines tiene muy preocupado al Concilio Supremo. Llevamos bastante tiempo sin tener noticias del Valle de las Minas.
			};
		};
	};

	if (Kapitel == 4)
	{
		AI_Output (self,other,"DIA_NOV_8_STANDARD_08_10"); //No, y le doy gracias a nuestro Se�or por ello. �Con el Ojo de Innos podremos derrotar a los dragones!
	};
	
	if (Kapitel >= 5)
	{
		AI_Output (self,other,"DIA_NOV_8_STANDARD_08_11"); //S�. �Hemos vencido a los dragones! Innos nos ha demostrado que no debemos desesperar nunca.
		AI_Output (self,other,"DIA_NOV_8_STANDARD_08_12"); //No obstante, a�n hay muchas sombras y tendremos que encender muchas hogueras para eliminarlas.
	};
};


// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_NOV_8 (var c_NPC slf)
{
	DIA_NOV_8_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_NOV_8_JOIN.npc					= Hlp_GetInstanceID(slf);
	DIA_NOV_8_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_NOV_8_LOCATION.npc				= Hlp_GetInstanceID(slf);
	DIA_NOV_8_STANDARD.npc				= Hlp_GetInstanceID(slf);
	DIA_NOV_8_Fegen.npc					= Hlp_GetInstanceID(slf);
	DIA_NOV_8_Wurst.npc					= Hlp_GetInstanceID(slf);
};
