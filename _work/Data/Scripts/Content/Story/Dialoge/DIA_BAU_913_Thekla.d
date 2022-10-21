// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Thekla_EXIT (C_INFO)
{
	npc         = BAU_913_Thekla;
	nr          = 999;
	condition   = DIA_Thekla_EXIT_Condition;
	information = DIA_Thekla_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Thekla_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Thekla_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

// ************************************************************
// 			  				   Hallo 
// ************************************************************
instance DIA_Thekla_HALLO		(C_INFO)
{
	npc		 	= BAU_913_Thekla;
	nr		 	= 1;
	condition	= DIA_Thekla_HALLO_Condition;
	information	= DIA_Thekla_HALLO_Info;
	permanent 	= FALSE;
	important	= TRUE;
};

func int DIA_Thekla_HALLO_Condition ()
{
	return TRUE;
};

func void DIA_Thekla_HALLO_Info ()
{
	AI_Output (self, other, "DIA_Thekla_HALLO_17_00"); //Co d�l� tady v kuchyni?
};

// ************************************************************
// 			  				   Lecker
// ************************************************************
instance DIA_Thekla_Lecker		(C_INFO)
{
	npc		 	= BAU_913_Thekla;
	nr		 	= 2;
	condition	= DIA_Thekla_Lecker_Condition;
	information	= DIA_Thekla_Lecker_Info;
	permanent 	= FALSE;
	description	= "N�co tady v�born� von�!";
};

func int DIA_Thekla_Lecker_Condition ()
{
	if (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Thekla_Lecker_Info ()
{
	AI_Output (other, self, "DIA_Thekla_Lecker_15_00"); //N�co tady v�born� von�!
	AI_Output (self, other, "DIA_Thekla_Lecker_17_01"); //No jasn�! Takov� jako ty dob�e zn�m! Takov�ch se tady po okol� potuluj� spousty.
	AI_Output (self, other, "DIA_Thekla_Lecker_17_02"); //Nejd��v se sna�� vet��t do tvoj� p��zn� a pak, kdy� je pot�ebuje�, nejsou nikde k nalezen�!
};

// ************************************************************
// 			  				   Hunger
// ************************************************************
var int Thekla_GaveStew;
// ---------------------

instance DIA_Thekla_Hunger		(C_INFO)
{
	npc		 	= BAU_913_Thekla;
	nr		 	= 3;
	condition	= DIA_Thekla_Hunger_Condition;
	information	= DIA_Thekla_Hunger_Info;
	permanent 	= FALSE;
	description	= "M�m hlad!";
};

func int DIA_Thekla_Hunger_Condition ()
{
	if (Thekla_GaveStew == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Thekla_Hunger_Info ()
{
	AI_Output (other, self, "DIA_Thekla_Hunger_15_00"); //M�m hlad!
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Thekla_Hunger_17_01"); //Neserv�ruju tul�k�m. J�dlo je jen pro lidi, co tu pracuj�.
		AI_Output (self, other, "DIA_Thekla_Hunger_17_02"); //(pohrdav�) A pro tu �old�ckou ch�tru, samoz�ejm�.
	}
	else if (other.guild == GIL_SLD)
	|| 		(other.guild == GIL_DJG)
	{
		AI_Output (self, other, "DIA_Thekla_Hunger_17_03"); //Tady, tv�j dlabanec.
		B_GiveInvItems (self, other, ItFo_XPStew, 1);
		Thekla_GaveStew = TRUE;
	}
	else if (other.guild == GIL_MIL)
	{
		AI_Output (self, other, "DIA_Thekla_Hunger_17_04"); //Tady se j�dlo voj�k�m nepod�v�.
	}
	else //Pal, Kdf oder Nov
	{
		AI_Output (self, other, "DIA_Thekla_Hunger_17_05"); //Jak by se dal odm�tnout Innos�v zmocn�nec?
		B_GiveInvItems (self, other, ItFo_XPStew, 1);
		Thekla_GaveStew = TRUE;
	};
};

// ************************************************************
// 			  				   Arbeit
// ************************************************************

instance DIA_Thekla_Arbeit		(C_INFO)
{
	npc		 	= BAU_913_Thekla;
	nr		 	= 4;
	condition	= DIA_Thekla_Arbeit_Condition;
	information	= DIA_Thekla_Arbeit_Info;
	permanent 	= FALSE;
	description	= "Hled�m pr�ci.";
};

func int DIA_Thekla_Arbeit_Condition ()
{
	if (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Thekla_Arbeit_Info ()
{
	AI_Output (other, self, "DIA_Thekla_Arbeit_15_00"); //Hled�m pr�ci...
	AI_Output (self, other, "DIA_Thekla_Arbeit_17_01"); //Chce� pracovat tady na farm�?
	AI_Output (self, other, "DIA_Thekla_Arbeit_17_02"); //O tom m��e rozhodnout pouze Onar. Farma pat�� jemu, stejn� jako cel� �dol�.
};

// ************************************************************
// 			  				   WannaJoin
// ************************************************************

instance DIA_Thekla_WannaJoin		(C_INFO)
{
	npc		 	= BAU_913_Thekla;
	nr		 	= 5;
	condition	= DIA_Thekla_WannaJoin_Condition;
	information	= DIA_Thekla_WannaJoin_Info;
	permanent 	= FALSE;
	description	= "Vlastn� jsem se cht�l p�ipojit k �oldn���m.";
};

func int DIA_Thekla_WannaJoin_Condition ()
{
	if (other.guild == GIL_NONE)
	&& (Npc_KnowsInfo (other, DIA_Thekla_Arbeit))
	{
		return TRUE;
	};
};

func void DIA_Thekla_WannaJoin_Info ()
{
	AI_Output (other, self, "DIA_Thekla_WannaJoin_15_00"); //Vlastn� jsem se cht�l p�ipojit k �oldn���m.
	AI_Output (self, other, "DIA_Thekla_WannaJoin_17_01"); //Tak�e ty jsi dal�� z t�ch lotr� z trestaneck� kolonie?
	AI_Output (self, other, "DIA_Thekla_WannaJoin_17_02"); //To se dalo �ekat! Nech m� na pokoji! Takov�ch jako ty u� je tady v okol� a� dost!
};

// ************************************************************
// 			  				   Schlafen
// ************************************************************

instance DIA_Thekla_Schlafen		(C_INFO)
{
	npc		 	= BAU_913_Thekla;
	nr		 	= 6;
	condition	= DIA_Thekla_Schlafen_Condition;
	information	= DIA_Thekla_Schlafen_Info;
	permanent 	= FALSE;
	description	= "Pot�ebuju se n�kde vyspat.";
};

func int DIA_Thekla_Schlafen_Condition ()
{
	if (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Thekla_Schlafen_Info ()
{
	AI_Output (other, self, "DIA_Thekla_Schlafen_15_00"); //Pot�ebuju se n�kde vyspat.
	AI_Output (self, other, "DIA_Thekla_Schlafen_17_01"); //Ani nepomysli na to, �e by ses mohl vyspat v moj� kuchyni. Najdi si n�co ve stodole.
};
		
// ************************************************************
// 			  				   Problem
// ************************************************************

instance DIA_Thekla_Problem		(C_INFO)
{
	npc		 	= BAU_913_Thekla;
	nr		 	= 7;
	condition	= DIA_Thekla_Problem_Condition;
	information	= DIA_Thekla_Problem_Info;
	permanent 	= FALSE;
	description	= "Co m� za probl�my se �old�ky?";
};

func int DIA_Thekla_Problem_Condition ()
{
	if (kapitel <= 3)
	&& (Npc_KnowsInfo (other, DIA_Thekla_WannaJoin))
	{
		return TRUE;
	};
};

func void DIA_Thekla_Problem_Info ()
{
	AI_Output (other, self, "DIA_Thekla_Problem_15_00"); //Co m� za probl�my se �old�ky?
	AI_Output (self, other, "DIA_Thekla_Problem_17_01"); //Ach, ti pitomci mi v�n� lezou na nervy! Obzvl᚝ Sylvio a jeho tlustej k�mo� Bullco.
	AI_Output (self, other, "DIA_Thekla_Problem_17_02"); //Ti dva tu sed� cel� dny a ztrp�uj� mi �ivot.
	AI_Output (self, other, "DIA_Thekla_Problem_17_03"); //Ta pol�vka je moc hork�, maso moc tuh� a tak po��d dokola.
	if (other.guild == GIL_NONE)
	{
		AI_Output (other, self, "DIA_Thekla_Problem_15_04"); //A pro� s t�m teda n�co neud�l�?
		AI_Output (self, other, "DIA_Thekla_Problem_17_05"); //A co jako m�m d�lat, pane Chytrol�n? Pra�tit je v�le�kem? To si m��u dovolit na farm��e, ale tihle podl� bastardi mi to prost� vr�t�.
	};
};

// ************************************************************
// 			  				   Manieren
// ************************************************************

instance DIA_Thekla_Manieren		(C_INFO)
{
	npc		 	= BAU_913_Thekla;
	nr		 	= 7;
	condition	= DIA_Thekla_Manieren_Condition;
	information	= DIA_Thekla_Manieren_Info;
	permanent 	= FALSE;
	description	= "Chce�, abych ty dva nau�il slu�n�m zp�sob�m?";
};

func int DIA_Thekla_Manieren_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Thekla_Problem)) 
	&& (Sylvio.aivar[AIV_LastFightAgainstPlayer] == FIGHT_NONE)
	&& (Bullco.aivar[AIV_LastFightAgainstPlayer] == FIGHT_NONE)
	&& (Kapitel <= 3)
	{
		return TRUE;
	};
};

func void DIA_Thekla_Manieren_Info ()
{
	AI_Output (other, self, "DIA_Thekla_Manieren_15_00"); //Chce�, abych ty dva nau�il slu�n�m zp�sob�m?
	AI_Output (self, other, "DIA_Thekla_Manieren_17_01"); //Ud�l� l�p, kdy� to nebude� zkou�et, drahou�ku. Co v�m, tak Sylvio m� magickou zbroj. Jeho nem��e� porazit.
	AI_Output (other, self, "DIA_Thekla_Manieren_15_02"); //A co Bullco?
	AI_Output (self, other, "DIA_Thekla_Manieren_17_03"); //Ten chlap je silnej jako hovado. Co pamatuju, srazil ka�d�ho, kdo jemu nebo Sylviovi d�lal pot�e.
};
		
// ************************************************************
// 			  				  After Fight
// ************************************************************

instance DIA_Thekla_AfterFight (C_INFO)
{
	npc		 	= BAU_913_Thekla;
	nr		 	= 7;
	condition	= DIA_Thekla_AfterFight_Condition;
	information	= DIA_Thekla_AfterFight_Info;
	permanent 	= FALSE;
	important 	= TRUE;
};

func int DIA_Thekla_AfterFight_Condition ()
{
	if (Sylvio.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON)
	|| (Bullco.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON)
	|| (Bullco.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	&& (Kapitel <= 3)
	{
		return TRUE;
	};
};

func void DIA_Thekla_AfterFight_Info ()
{
	if (Bullco.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	{
		AI_Output (self, other, "DIA_Thekla_AfterFight_17_00"); //V�n� bys m�l nechat Bullca na pokoji, drahou�ku.
		AI_Output (self, other, "DIA_Thekla_AfterFight_17_01"); //To mus� b�t po��dn� fu�ka srazit to tlust� prase.
	}
	else //Sylvio oder Bullco gewonnen
	{
		AI_Output (self, other, "DIA_Thekla_AfterFight_17_02"); //Dostals docela nakl�da�ku, drahou�ku.
		AI_Output (self, other, "DIA_Thekla_AfterFight_17_03"); //Ne��kala jsem ti to snad? Te� v�, co jsem m�la na mysli.
		AI_Output (other, self, "DIA_Thekla_AfterFight_15_04"); //Jsem r�d, �e se dob�e bav�.
		AI_Output (self, other, "DIA_Thekla_AfterFight_17_05"); //Tak te� tak neprotahuj obli�ej. Nejsi prvn�, kdo od toho ne��da dostal napr�sk�no.
	};
	
	AI_Output (self, other, "DIA_Thekla_AfterFight_17_06"); //Tady, dej si trochu v�varu, a� se ti vr�t� s�la.
	B_GiveInvItems (self, other, ItFo_XPStew, 1);	
	Thekla_GaveStew = TRUE;
};

// ************************************************************
// 			  				 PaketSuccess 
// ************************************************************
instance DIA_Thekla_SagittaPaket (C_INFO)
{
	npc		 	= BAU_913_Thekla;
	nr		 	= 4;
	condition	= DIA_Thekla_SagittaPaket_Condition;
	information	= DIA_Thekla_SagittaPaket_Info;
	permanent 	= TRUE;
	description	= "Tady je bal�k od Sagitty.";
};

func int DIA_Thekla_SagittaPaket_Condition ()
{
	if (Npc_HasItems (other,ItMi_TheklasPaket))
	&& (MIS_Thekla_Paket == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Thekla_SagittaPaket_Info ()
{
	B_GiveInvItems (other, self, ItMi_TheklasPaket, 1);
	AI_Output (other, self, "DIA_Thekla_SagittaPaket_15_00"); //Tady je bal�k od Sagitty.
	AI_Output (self, other, "DIA_Thekla_SagittaPaket_17_01"); //D�ky moc. Tak jsi byl p�ece jen k n��emu dobr�.
	MIS_Thekla_Paket = LOG_SUCCESS;
	B_GivePlayerXP (XP_TheklasPaket);		
};

// ************************************************************
// 			  				   PERM 
// ************************************************************
var int Thekla_MehrEintopfKap1;
var int Thekla_MehrEintopfKap3;
var int Thekla_MehrEintopfKap5;
// ------------------------

instance DIA_Thekla_PERM		(C_INFO)
{
	npc		 	= BAU_913_Thekla;
	nr		 	= 900;
	condition	= DIA_Thekla_PERM_Condition;
	information	= DIA_Thekla_PERM_Info;
	permanent	= TRUE;
	description	= "M��u dostat je�t� trochu toho v�varu?";
};
func int DIA_Thekla_PERM_Condition()
{
	if (Thekla_GaveStew == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Thekla_PERM_Info()
{
	AI_Output (other, self, "DIA_Thekla_PERM_15_00"); //M��u dostat je�t� trochu toho v�varu?
	
	if (MIS_Thekla_Paket == FALSE)
	{	
		AI_Output (self, other, "DIA_Thekla_PERM_17_01"); //U� nic nem�m.
		AI_Output (other, self, "DIA_Thekla_PERM_15_02"); //Ani mali�kou misku?
		AI_Output (self, other, "DIA_Thekla_PERM_17_03"); //Ne.
		AI_Output (other, self, "DIA_Thekla_PERM_15_04"); //A m��u alespo� vyl�zat hrnec?
		AI_Output (self, other, "DIA_Thekla_PERM_17_05"); //Nech� toho?!
		AI_Output (self, other, "DIA_Thekla_PERM_17_06"); //Kdy� tak prahne� po m�m v�varu, m�l bys pro to n�co ud�lat.
		AI_Output (other, self, "DIA_Thekla_PERM_15_07"); //Co?
		AI_Output (self, other, "DIA_Thekla_PERM_17_08"); //Zajdi za Sagittou, l��itelkou, co �ije za Sekobovou farmou, a p�ines mi od n� svazek bylinek.
		AI_Output (self, other, "DIA_Thekla_PERM_17_09"); //Kdy� mi p�inese� ty bylinky, ud�l�m ti trochu v�varu.
		
		MIS_Thekla_Paket = LOG_RUNNING;
		
		CreateInvItems (Sagitta,ItMi_TheklasPaket,1);
		
		Log_CreateTopic (TOPIC_TheklaEintopf,LOG_MISSION);
		Log_SetTopicStatus (TOPIC_TheklaEintopf,LOG_RUNNING);
		B_LogEntry (TOPIC_TheklaEintopf,"Kdy� Thekle p�inesu byliny od l��itelky Sagitty, uva�� mi je�t� dal�� lektvar. Sagitta p�eb�v� kousek za Sekobov�m statkem.");
		
	}
	else if (MIS_Thekla_Paket == LOG_SUCCESS)
	{
		if (Kapitel <= 2)
		{
			if (Thekla_MehrEintopfKap1 == FALSE)
			{
				AI_Output (self, other, "DIA_Thekla_PERM_17_10"); //Dobr�. Tak budu hodn�. Tady. A� mi neum�e� hlady p�ed o�ima.
				B_GiveInvItems (self, other, ItFo_XPStew, 1);
				Thekla_MehrEintopfKap1 = TRUE;
			}
			else 
			{
				AI_Output (self, other, "DIA_Thekla_PERM_17_11"); //Hej, hej, hej, ne tak rychle! D�m ti v�d�t, a� pro tebe najdu n�jakou pr�ci.
				AI_Output (self, other, "DIA_Thekla_PERM_17_12"); //A PAK dostane� v�c v�varu, je to jasn�?
			};
		};
		
		if (Kapitel == 3)
		|| (Kapitel == 4)
		{
			if (Thekla_MehrEintopfKap3 == FALSE)
			&& (MIS_RescueBennet == LOG_SUCCESS)
			{
				AI_Output (self, other, "DIA_Thekla_PERM_17_13"); //Sly�ela jsem, �es pomohl Bennetovi z v�zen�. Dobr� pr�ce, hochu.
				B_GiveInvItems (self, other, ItFo_XPStew, 1);
				Thekla_MehrEintopfKap3 = TRUE;
			}
			else 
			{
				if (MIS_RescueBennet != LOG_SUCCESS)
				{
					AI_Output (self, other, "DIA_Thekla_PERM_17_14"); //Ty bastardi od domobrany hodili Benneta do lochu.
					AI_Output (self, other, "DIA_Thekla_PERM_17_15"); //Ud�lej mi laskavost a dosta� ho odtamtud, jo? A j� ti zat�m ud�l�m trochu toho b�je�n�ho v�varu.
				}
				else
				{
					AI_Output (self, other, "DIA_Thekla_PERM_17_16"); //U� mi nic nezbylo. Vra� se pozd�jc.
				};
			};
		};
		
		if (Kapitel >= 5)	
		{
			if (Thekla_MehrEintopfKap5 == FALSE)
			{
				AI_Output (self, other, "DIA_Thekla_PERM_17_17"); //Ty jsi po��d hladovej, co? A co vlastn� po��d d�l�?
				AI_Output (other, self, "DIA_Thekla_PERM_15_18"); //Sejmul jsem p�r drak�.
				AI_Output (self, other, "DIA_Thekla_PERM_17_19"); //�! Tak to m�m dojem, �e nade�la chv�le na po��dnej hrnec v�varu.
				B_GiveInvItems (self, other, ItFo_XPStew, 1);
				Thekla_MehrEintopfKap5 = TRUE;
			}
			else 
			{
				AI_Output (self, other, "DIA_Thekla_PERM_17_20"); //Pozd�. U� ��dn� v�var nezbyl.
			};
		};
	}
	else //Running oder Failed
	{
		AI_Output (self, other, "DIA_Thekla_PERM_17_21"); //��dn� bylinky, ��dn� v�var - v�me?
	};
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Thekla_PICKPOCKET (C_INFO)
{
	npc			= BAU_913_Thekla;
	nr			= 900;
	condition	= DIA_Thekla_PICKPOCKET_Condition;
	information	= DIA_Thekla_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60_Female;
};                       

FUNC INT DIA_Thekla_PICKPOCKET_Condition()
{
	C_Beklauen (53, 60);
};
 
FUNC VOID DIA_Thekla_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Thekla_PICKPOCKET);
	Info_AddChoice		(DIA_Thekla_PICKPOCKET, DIALOG_BACK 		,DIA_Thekla_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Thekla_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Thekla_PICKPOCKET_DoIt);
};

func void DIA_Thekla_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Thekla_PICKPOCKET);
};
	
func void DIA_Thekla_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Thekla_PICKPOCKET);
};























