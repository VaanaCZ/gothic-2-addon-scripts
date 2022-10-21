
///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Skip_NW_EXIT   (C_INFO)
{
	npc         = PIR_1301_Addon_Skip_NW;
	nr          = 999;
	condition   = DIA_Addon_Skip_NW_EXIT_Condition;
	information = DIA_Addon_Skip_NW_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Skip_NW_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Skip_NW_EXIT_Info()
{
	AI_StopProcessInfos (self);
	
	PlayerTalkedToSkipNW = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Skip_NW_Hallo		(C_INFO)
{
	npc		 = 	PIR_1301_Addon_Skip_NW;
	nr		 = 	1;
	condition	 = 	DIA_Addon_Skip_NW_Hallo_Condition;
	information	 = 	DIA_Addon_Skip_NW_Hallo_Info;
	important	 = 	TRUE;
};
func int DIA_Addon_Skip_NW_Hallo_Condition ()
{
	return TRUE;
};

func void DIA_Addon_Skip_NW_Hallo_Info ()
{
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Hallo_08_00"); //(na�tvan�) To je dost, �e jde�. U� tu na tebe �ek�m hezkejch p�r hodin.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Hallo_08_01"); //(zmaten�) Moment, ty nejse� vobchodn�k z m�sta, �e ne?
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Hallo_08_02"); //(na�tvan�) Kde je Baltram?
};

///////////////////////////////////////////////////////////////////////
//	Info WerBistDu
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Skip_NW_WerBistDu		(C_INFO)
{
	npc		 = 	PIR_1301_Addon_Skip_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Skip_NW_WerBistDu_Condition;
	information	 = 	DIA_Addon_Skip_NW_WerBistDu_Info;

	description	 = 	"Kdo jsi?";
};

func int DIA_Addon_Skip_NW_WerBistDu_Condition ()
{
	return TRUE;
};

func void DIA_Addon_Skip_NW_WerBistDu_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Skip_NW_WerBistDu_15_00"); //Kdo jsi?
	AI_Output	(self, other, "DIA_Addon_Skip_NW_WerBistDu_08_01"); //Sice ti po tom nic nen�, ale kdy� u� to chce� v�d�t, jmenuju se Skip. Nep�ipom�n� ti to nic?
	AI_Output	(other, self, "DIA_Addon_Skip_NW_WerBistDu_15_02"); //(p�edst�r�, �e nerozum�) Kdo�e to?
	AI_Output	(self, other, "DIA_Addon_Skip_NW_WerBistDu_08_03"); //To mi chce� namluvit, �es o Skipovi nikdy nesly�el? Ty vole, kde to �ije�?
	AI_Output	(self, other, "DIA_Addon_Skip_NW_WerBistDu_08_04"); //Sem jeden z nejhledan�j��ch khorinidskejch zlo�inc�. J� a m� chlapi jsme u� cel� l�ta postrachem vod kolem tohohle p�ipitom�l�ho ostrova.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_WerBistDu_08_05"); //(rozho��en�) Ale no tak, ur�it� u� jsi o mn� sly�el.
	
	Info_ClearChoices	(DIA_Addon_Skip_NW_WerBistDu);
	Info_AddChoice	(DIA_Addon_Skip_NW_WerBistDu, "Ty jsi pir�t.", DIA_Addon_Skip_NW_WerBistDu_pirat );
	Info_AddChoice	(DIA_Addon_Skip_NW_WerBistDu, "My se zn�me?", DIA_Addon_Skip_NW_WerBistDu_keineAhnung );
	Info_AddChoice	(DIA_Addon_Skip_NW_WerBistDu, "No jasn�, u� se mi to v�ecko vybavuje.", DIA_Addon_Skip_NW_WerBistDu_ja );
};
func void DIA_Addon_Skip_NW_WerBistDu_ja ()
{
	AI_Output (other, self, "DIA_Addon_Skip_NW_WerBistDu_ja_15_00"); //Ale samoz�ejm�, u� si vzpom�n�m.
	AI_Output (self, other, "DIA_Addon_Skip_NW_WerBistDu_ja_08_01"); //(zmaten�) V�n�? Ty u� jsi o mn� v�n� sly�el?
	AI_Output (self, other, "DIA_Addon_Skip_NW_WerBistDu_ja_08_02"); //Doprdele! A j� si ��kal, �e se projdu po m�st�.
	AI_Output (self, other, "DIA_Addon_Skip_NW_WerBistDu_ja_08_03"); //E�t�e jsem to neud�lal.

	if (hero.guild != GIL_MIL)
	&& (hero.guild != GIL_PAL)
	{
		AI_Output (self, other, "DIA_Addon_Skip_NW_WerBistDu_ja_08_04"); //Domobrana by m� hned zav�ela do lap�ku.
	}
	else 
	{
		AI_Output (self, other, "DIA_Addon_Skip_NW_WerBistDu_ja_08_05"); //Ale ty m� nepr�skne�, �e ne?
		AI_Output (other, self, "DIA_Addon_Skip_NW_WerBistDu_ja_15_06"); //Noooo...
		AI_Output (self, other, "DIA_Addon_Skip_NW_WerBistDu_ja_08_07"); //Dob�e d�l�. P�� kdy� se se star�m Skipem pust� do k��ku, se� mrtvej mu�.
	};
	
	Info_ClearChoices	(DIA_Addon_Skip_NW_WerBistDu);
};

func void DIA_Addon_Skip_NW_WerBistDu_keineAhnung ()
{
	AI_Output			(other, self, "DIA_Addon_Skip_NW_WerBistDu_keineAhnung_15_00"); //M�l bych t� snad zn�t?
	AI_Output			(self, other, "DIA_Addon_Skip_NW_WerBistDu_keineAhnung_08_01"); //Pozor na hubu, chlape, nebo ti starej Skip d� co proto.
	Info_ClearChoices	(DIA_Addon_Skip_NW_WerBistDu);
};

func void DIA_Addon_Skip_NW_WerBistDu_pirat ()
{
	AI_Output			(other, self, "DIA_Addon_Skip_NW_WerBistDu_pirat_15_00"); //Ty jsi pir�t.
	AI_Output			(self, other, "DIA_Addon_Skip_NW_WerBistDu_pirat_08_01"); //(na�tvan�) Jo, sakra, to je snad jasn� na prvn� pohled. A p�kn� z�ke�nej.
	AI_Output			(self, other, "DIA_Addon_Skip_NW_WerBistDu_pirat_08_02"); //U� m� nud� furt vokous�vat prkna sv� lodi.
	Info_ClearChoices	(DIA_Addon_Skip_NW_WerBistDu);
};
///////////////////////////////////////////////////////////////////////
//	Info Baltram
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Skip_NW_Baltram		(C_INFO)
{
	npc		 = 	PIR_1301_Addon_Skip_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Skip_NW_Baltram_Condition;
	information	 = 	DIA_Addon_Skip_NW_Baltram_Info;

	description	 = 	"Baltram? Ty �ek� na kupce?";
};

func int DIA_Addon_Skip_NW_Baltram_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Skip_NW_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_NW_Baltram_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Skip_NW_Baltram_15_00"); //Baltram? Ty �ek� na kupce?
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Baltram_08_01"); //Ty se� ��kej chytrej.
	if (C_BodyStateContains (self, BS_SIT))
	{
		AI_StandUp (self);
		B_TurnToNpc (self,other);
	};
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Baltram_08_02"); //Sem to snad pr�v� �ek, ne?
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Baltram_08_03"); //Jen�e ten nanicovatej kup��k na m� nejsp� zapomn�l.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Baltram_08_04"); //Dostat ho tak do ruky...
	
	Log_CreateTopic (TOPIC_Addon_BaltramSkipTrade, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_BaltramSkipTrade, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_BaltramSkipTrade,"Pir�t Skip mi nazna�il, �e m�stn� kupec Baltram obchoduje s pir�ty."); 
	
	SCKnowsBaltramAsPirateTrader = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info BaltramPaket
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Skip_BaltramPaket		(C_INFO)
{
	npc		 = 	PIR_1301_Addon_Skip_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Skip_BaltramPaket_Condition;
	information	 = 	DIA_Addon_Skip_BaltramPaket_Info;

	description	 = 	"M�m pro tebe bal��ek - od Baltrama.";
};

func int DIA_Addon_Skip_BaltramPaket_Condition ()
{
	if (MIS_Addon_Baltram_Paket4Skip == LOG_RUNNING)
	&& (Npc_HasItems (other,ItMi_Packet_Baltram4Skip_Addon))
		{
			return TRUE;
		};
};

func void DIA_Addon_Skip_BaltramPaket_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Skip_BaltramPaket_15_00"); //M�m pro tebe bal�k � od Baltrama.
	AI_Output	(self, other, "DIA_Addon_Skip_BaltramPaket_08_01"); //Co�e? Von si pos�l� posl��ky?
	AI_Output	(self, other, "DIA_Addon_Skip_BaltramPaket_08_02"); //Je celej posranej strachy, co? No jo, co bych taky vod toho star�ho skrbl�ka cht�l.
	B_GiveInvItems (other, self, ItMi_Packet_Baltram4Skip_Addon,1);
	AI_Output	(other, self, "DIA_Addon_Skip_BaltramPaket_15_03"); //Tvrdil, �e za to chce 3 lahve rumu.
	AI_Output	(self, other, "DIA_Addon_Skip_BaltramPaket_08_04"); //(sm�je se) To by se mu l�bilo! Nap�ed m� tu nech� celou v��nost �ekat, ani se tu osobn� neuk�e, a pak m� e�t� tu drzost vymej�let si takov�hle kr�voviny.
	AI_Output	(self, other, "DIA_Addon_Skip_BaltramPaket_08_05"); //Tum�, dej mu dv� fla�ky, to mu sta��.
	CreateInvItems (self, ItFo_Addon_Rum, 2);									
	B_GiveInvItems (self, other, ItFo_Addon_Rum, 2);		
	B_GivePlayerXP (XP_Addon_Skip_BaltramPaket);

	B_LogEntry (TOPIC_Addon_BaltramSkipTrade,LogText_Addon_SkipsRumToBaltram); 
	Skip_Rum4Baltram = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info Woher
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Skip_NW_Woher		(C_INFO)
{
	npc		 = 	PIR_1301_Addon_Skip_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Skip_NW_Woher_Condition;
	information	 = 	DIA_Addon_Skip_NW_Woher_Info;

	description	 = 	"Odkud jsi p�i�el?";
};

func int DIA_Addon_Skip_NW_Woher_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Skip_NW_WerBistDu))
		{
			return TRUE;
		};
};

func void DIA_Addon_Skip_NW_Woher_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Skip_NW_Woher_15_00"); //Odkud poch�z�?
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Woher_08_01"); //Chce� v�d�t, kde se ukrejv�me?

	if (hero.guild == GIL_MIL)
	{
		AI_Output	(self, other, "DIA_Addon_Skip_NW_Woher_08_02"); //To je to posledn�, co bych n�komu z domobrany vy�vanil.
	}
	else
	{
		AI_Output	(self, other, "DIA_Addon_Skip_NW_Woher_08_03"); //Kdybych ti to �ek, to u� m��u rovnou pozvat domobranu, a� m� zatkne.
	};

	AI_Output	(self, other, "DIA_Addon_Skip_NW_Woher_08_04"); //A pokud bys n�s cht�l nav�t�vit, nehnul bych pro tebe ani prstem.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Woher_08_05"); //Ostrov Khorinis je velkej, ale tam, co sme my, se beztak nikdo nedostane. Pokud teda nem� ��kou lo�.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Woher_08_06"); //A pak e�t� mus� zn�t cestu p�es �tesy. Nikdo tamtudy nepropluje, kdy� nezn� tajnou trasu.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Woher_08_07"); //A tu znaj akor�t dva lidi � a ty mezi n� nepat��.
};


///////////////////////////////////////////////////////////////////////
//	Info SCSawGreg
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Skip_SCSawGreg		(C_INFO)
{
	npc		 = 	PIR_1301_Addon_Skip_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Skip_SCSawGreg_Condition;
	information	 = 	DIA_Addon_Skip_SCSawGreg_Info;

	description	 = 	"Zn� n�koho, kdo nos� p�sku p�es oko?";
};

func int DIA_Addon_Skip_SCSawGreg_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Skip_NW_Woher))
	&& (SC_KnowsConnectionSkipGreg == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Skip_SCSawGreg_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Skip_SCSawGreg_15_00"); //Nezn� n�koho s p�skou p�es oko?
	AI_Output	(self, other, "DIA_Addon_Skip_SCSawGreg_08_01"); //Zn�m hromadu chlap� s p�skama p�es voko.
	AI_Output	(other, self, "DIA_Addon_Skip_SCSawGreg_15_02"); //Po Khorinidu chod� n�kdo, kdo t� pravd�podobn� dost dob�e zn�.
	AI_Output	(self, other, "DIA_Addon_Skip_SCSawGreg_08_03"); //Nem�m tucha, kdo by to moh bejt, se suchozemskejma krysama se nebavim.
	AI_Output	(other, self, "DIA_Addon_Skip_SCSawGreg_15_04"); //Ale...
	AI_Output	(self, other, "DIA_Addon_Skip_SCSawGreg_08_05"); //Nech to bejt, fakt je mi to u prdele.
	B_GivePlayerXP (XP_Ambient);
};

///////////////////////////////////////////////////////////////////////
//	Info MissingPeople
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Skip_NW_MissingPeople		(C_INFO)
{
	npc		 = 	PIR_1301_Addon_Skip_NW;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Skip_NW_MissingPeople_Condition;
	information	 = 	DIA_Addon_Skip_NW_MissingPeople_Info;

	description	 = 	"Poh�e�uj� se n�jac� m�stn� lid�.";
};

func int DIA_Addon_Skip_NW_MissingPeople_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Skip_NW_Woher))
	&& (MIS_Addon_Vatras_WhereAreMissingPeople == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_NW_MissingPeople_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Skip_NW_MissingPeople_15_00"); //Spousta zdej��ch obyvatel se poh�e�uje a v�ecko poukazuje na to, �e bys o tom mohl n�co v�d�t.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_MissingPeople_08_01"); //(c�t� se zasko�en) No... sakra, nen� to tak, jak si mysl�.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_MissingPeople_08_02"); //Copak vypad�m jako ��kej votrok��? Ne, p�ev�im akor�t zbo��. Co je to za� a vodku� je, to nejni m�j probl�m.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_MissingPeople_08_03"); //My pro tu svini u� p�ev�eli snad v�ecko.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_MissingPeople_08_04"); //Nap�ed to byly norm�ln� v�ci. No, vob�as to bylo pa�ovan�.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_MissingPeople_08_05"); //Ale pak za�ali un�et lidi z tohohle m�sta. Netu�im, co s nima cht�li d�lat.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_MissingPeople_08_06"); //My je akor�t p�ev�eli na m�sto.
};
///////////////////////////////////////////////////////////////////////
//	Info Dexter
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Skip_NW_Dexter		(C_INFO)
{
	npc		 = 	PIR_1301_Addon_Skip_NW;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Skip_NW_Dexter_Condition;
	information	 = 	DIA_Addon_Skip_NW_Dexter_Info;

	description	 = 	"O kom to mluv�?";
};

func int DIA_Addon_Skip_NW_Dexter_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Skip_NW_MissingPeople))
		{
			return TRUE;
		};
};

func void DIA_Addon_Skip_NW_Dexter_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Skip_NW_Dexter_15_00"); //O kom to mluv�?
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Dexter_08_01"); //Banditi, samoz�ejm�, kdo jinej? Ta �pinav� sebranka, co se tu rozlezla po cel�m vostrov�.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Dexter_08_02"); //A nejenom tady kolem Khorinidu.
};


func void B_Skip_SaysDextersName ()
{
	AI_Output	(self, other, "DIA_Addon_Skip_SaysDextersName_08_00"); //Te� u� si vzpom�n�m � Dexter. Jo, myslim, �e mu ��kali Dexter.

	Log_CreateTopic (TOPIC_Addon_WhoStolePeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_WhoStolePeople,"Obyvatele Khorinidu un�el v�dce bandit� Dexter. M�l bych ho naj�t ji�n� od Onarova statku."); 

	SC_KnowsDexterAsKidnapper = TRUE;			
	Ranger_SCKnowsDexter = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info Name
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Skip_NW_Name		(C_INFO)
{
	npc		 = 	PIR_1301_Addon_Skip_NW;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Skip_NW_Name_Condition;
	information	 = 	DIA_Addon_Skip_NW_Name_Info;

	description	 = 	"'Banditi'? To mi nesta��. Chci n�jak� konkr�tn� jm�no.";
};

func int DIA_Addon_Skip_NW_Name_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Skip_NW_Dexter))
	&& (SCKnowsMissingPeopleAreInAddonWorld == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Skip_NW_Name_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Skip_NW_Name_15_00"); //Jenom 'banditi' mi nesta��. Pot�ebuji jm�no.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Name_08_01"); //Jm�no? To chce� jako v�d�t, kdo ty bandity vede? Do hajzlu, jak se ten �mejd jenom jmenoval...?
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Name_08_02"); //Hmm, te� si na to nem��u vzpomenout, i kdy� to nebylo moc slo�it�.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Name_08_03"); //Ale m��u ti uk�zat, kde najde� ��fa gangu z t�hle ��sti Khorinidu.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Name_08_04"); //M� ��kou slu�nou mapu?
	
	if (Npc_HasItems (other,ItWr_Map_NewWorld) == FALSE)
	{
		if (Npc_HasItems (other,ItWr_Map_NewWorld_Ornaments_Addon) == TRUE)
		|| (Npc_HasItems (other,ItWr_Map_Shrine_MIS) == TRUE)
		|| (Npc_HasItems (other,ItWr_Map_Caves_MIS) == TRUE)
		{
			AI_Output	(other, self, "DIA_Addon_Skip_NW_Name_15_05"); //Mapu m�m tady.
			AI_Output	(self, other, "DIA_Addon_Skip_NW_Name_08_06"); //Ale ta u� je po�m�ran�. To nem� cenu, kdy� ji nem��u po�m�rat j�.
		}
		else
		{
			AI_Output	(other, self, "DIA_Addon_Skip_NW_Name_15_07"); //Ne.
		};
		
		AI_Output	(self, other, "DIA_Addon_Skip_NW_Name_08_08"); //Tak ti to budu muset popsat.
		AI_Output	(self, other, "DIA_Addon_Skip_NW_Name_08_09"); //Na v�chod� je fakt velkej statek, ��fuje mu ��kej Onar, mysl�m.
		AI_Output	(self, other, "DIA_Addon_Skip_NW_Name_08_10"); //M� p�r docela velkejch pol�. A na jih od nich je na vysok�m �tesu mal� pevn�stka.
		AI_Output	(self, other, "DIA_Addon_Skip_NW_Name_08_11"); //A tam toho chlapa najde�.
		B_Skip_SaysDextersName ();
	};
};

///////////////////////////////////////////////////////////////////////
//	Info Landkarte
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Skip_NW_Landkarte		(C_INFO)
{
	npc		 = 	PIR_1301_Addon_Skip_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Skip_NW_Landkarte_Condition;
	information	 = 	DIA_Addon_Skip_NW_Landkarte_Info;

	description	 = 	"Tady. M�m mapu Khorinidu.";
};

func int DIA_Addon_Skip_NW_Landkarte_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Skip_NW_Name))
	&& (Npc_HasItems (other,ItWr_Map_NewWorld))
	&& (SCKnowsMissingPeopleAreInAddonWorld == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Skip_NW_Landkarte_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Skip_NW_Landkarte_15_00"); //Tady m�m mapu Khorinidu.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Landkarte_08_01"); //To je dobr�. Tak j� ti tam zakresl�m, kde se ten chl�pek schov�v�.
	B_GiveInvItems (other, self, ItWr_Map_NewWorld,1);
	B_Skip_SaysDextersName ();
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Landkarte_08_02"); //Tady m� tu mapu.
	
	Npc_RemoveInvItems	(self,ItWr_Map_NewWorld ,1 );
	CreateInvItems (self, ItWr_Map_NewWorld_Dexter, 1);									
	B_GiveInvItems (self, other, ItWr_Map_NewWorld_Dexter, 1);		
};

///////////////////////////////////////////////////////////////////////
//	Info Wohin
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Skip_NW_Wohin		(C_INFO)
{
	npc		 = 	PIR_1301_Addon_Skip_NW;
	nr		 = 	99;
	condition	 = 	DIA_Addon_Skip_NW_Wohin_Condition;
	information	 = 	DIA_Addon_Skip_NW_Wohin_Info;
	permanent	 = 	TRUE;

	description	 = 	"Kam jsi ty lidi odvlekl?";
};

func int DIA_Addon_Skip_NW_Wohin_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Skip_NW_Woher))
	&& (Npc_KnowsInfo (other, DIA_Addon_Skip_NW_MissingPeople))
		{
			return TRUE;
		};
};

func void DIA_Addon_Skip_NW_Wohin_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Skip_NW_Wohin_15_00"); //Kam jsi ty lidi unesl?
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Wohin_08_01"); //U� jsem ti �ek � ne�eknu ti, kde le�� na�e z�toka.
};
