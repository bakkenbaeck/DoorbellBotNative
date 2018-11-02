
package com.bakkenbaeck.doorbellbotnative.common

expect fun platformName(): String

fun createApplicationScreenMessage() : String {
    return "Hodor ${platformName()}"
}
